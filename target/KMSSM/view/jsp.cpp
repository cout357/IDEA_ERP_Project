#include<iostream>
#include<string>
#include<cstring>
#include<cstdio>
#include<regex>
#include<vector>
#include<windows.h>

const char PRE[200] = "view/";
const char SUF[200] = ".jsp"; 

using namespace std;

struct Mod {
	string modName;					//类别名 
	string modFileName;				//类别文件名 
	vector<Mod> subMods;			//子模块
};

char* U2G(const char* utf8){
	int len = MultiByteToWideChar(CP_UTF8, 0, utf8, -1, NULL, 0);
	wchar_t* wstr = new wchar_t[len+1];
	memset(wstr, 0, len+1);
	MultiByteToWideChar(CP_UTF8, 0, utf8, -1, wstr, len);
	len = WideCharToMultiByte(CP_ACP, 0, wstr, -1, NULL, 0, NULL, NULL);
	char* str = new char[len+1];
	memset(str, 0, len+1);
	WideCharToMultiByte(CP_ACP, 0, wstr, -1, str, len, NULL, NULL);
	if(wstr) delete[] wstr;
	return str;
}
char* G2U(const char* gb2312){
	int len = MultiByteToWideChar(CP_ACP, 0, gb2312, -1, NULL, 0);
	wchar_t* wstr = new wchar_t[len+1];
	memset(wstr, 0, len+1);
	MultiByteToWideChar(CP_ACP, 0, gb2312, -1, wstr, len);
	len = WideCharToMultiByte(CP_UTF8, 0, wstr, -1, NULL, 0, NULL, NULL);
	char* str = new char[len+1];
	memset(str, 0, len+1);
	WideCharToMultiByte(CP_UTF8, 0, wstr, -1, str, len, NULL, NULL);
	if(wstr) delete[] wstr;
	return str;
}
vector<Mod> getList();								//从键盘输入读取模块信息 
vector<Mod> getListByFile(string fileName);			//从文件中读取模块信息 
string getHTML(string fileName);
void createAllHTMLFile(string htmlTemp, vector<Mod> mods);
string getModsHTML(vector<Mod> mods, string htmlTemp, string selectItemTemp, string headItemTemp);				//将html模板替换成一个模块的html源码，并返回
string getModHTML(Mod mod,int subModIdx,string htmlTemp,string selectItemTemp);
string foot;
int main() {
	vector<Mod> mods = getListByFile("ERPMod.txt");
	string html = getHTML("temp.html");
	createAllHTMLFile(html, mods);

	return 0;
}

//vector<Mod> getListByCmd() {
//	vector<Mod> mods;
//	char name[100];
//	while (true) {
//		Mod mod;
//		cout << "请输入模块名:";
//		if (scanf("%s", name) == EOF)break;
//		mod.modName = name;
//		while (true) {
//			cout << "请输入子模块名:";
//			string subModName;
//			if (scanf("%s", name) == EOF)break;
//			mod.subModNames.push_back(name);
//		}
//		mods.push_back(mod);
//		cout << "------" << endl;
//	}
//	return mods;
//}
//去除字符串中的\t且返回\t数量 
int tSum(string &str){
	int i;
	for(i = 0;i < str.length();i++)
		if(str[i]!='-')break;
	str.erase(0,i);
	return i;
}

vector<Mod> getListByFile(string fileName) {
	FILE *fp;
	fp = fopen(fileName.c_str(),"r");
	if(fp==NULL){
		cout << "缺少" << fileName << "配置文件，生成失败！"  << endl;
		exit(0); 
	}
	vector<Mod> mods;
	char modName[200],modFileName[200];
	while(!feof(fp)){
		Mod mod;
		fscanf(fp,"%s%s",modName,modFileName);
		mod.modName = U2G(modName);
		mod.modFileName = U2G(modFileName);
		int tsum = tSum(mod.modName);
		cout << tsum << " ";
		if(tsum==0){					//头 
			mods.push_back(mod);
		}
		else if(tsum==1){				//子模块 
			mods.back().subMods.push_back(mod);
		}
		else if(tsum==2){
			mods.back().subMods.back().subMods.push_back(mod);
		}
	}
	cout << endl;
	for(Mod mod:mods){
		cout << mod.modName << endl;
		for(Mod subMod:mod.subMods){
			cout << "\t" << subMod.modName << endl;
			for(Mod subsubMod:subMod.subMods){
				cout << "\t\t" << subsubMod.modName << endl;
			}
		}
		cout << endl;
	}
	return mods;
}
string getHTML(string fileName) {
	FILE* fp;
	fp = fopen(fileName.c_str(), "r+");
	string html;
	char line[10000];
	bool isFoot = false;
	while (!feof(fp)) {
		fgets(line, 10000, fp);
		if(strcmp(U2G(line),"<!--foot-->\n")==0){
			isFoot = true;
			cout << "截取" << endl;
		}
		if(!isFoot)
			html.append(U2G(line));
		else
			foot.append(U2G(line));
	}
	
	fclose(fp);
	if(html[0]=='?')html.erase(html.begin());
	
	return html;
}
//返回替换头部导航栏后的模块html源码
string getModsHTML(vector<Mod> mods, string htmlTemp, string selectItemTemp, string headItemTemp) {
	smatch subModItemsm,headItem;
	regex_search(htmlTemp, subModItemsm, regex("@subMod-item[\\s\\S]*@/subMod-item"));
	string subModItemTemp = subModItemsm[0];
	//将头部导航栏的模板替换成@headItemPoint作为替换插入点
	htmlTemp = regex_replace(htmlTemp, regex(headItemTemp), "@headItemPoint");
	for (int i = 0; i < mods.size(); i++) {
		string headItem = headItemTemp;
		headItem = regex_replace(headItem,regex("@/headItem"),"@headItemPoint");
		headItem = regex_replace(headItem, regex("@modName"), mods[i].modName);
		headItem = regex_replace(headItem, regex("@modLink"), PRE + mods[i].modFileName + "-" + 
			(mods[i].subMods[0].subMods.empty()?mods[i].subMods[0].modFileName:mods[i].subMods[0].subMods[0].modFileName) + SUF);
		headItem = regex_replace(headItem, regex(subModItemTemp), "@subModItemPoint");
		//regex_replace(headItem, regex("@modFirstName"), mods[i].modName.substr(0,2));
		for (int j = 0; j < mods[i].subMods.size(); j++) {
			string subModItem = subModItemTemp;
			subModItem = regex_replace(subModItem,regex("@/subMod-item"),"@subModItemPoint");
			string selectItem = selectItemTemp;
			subModItem = regex_replace(subModItem, regex("@subModLink"), PRE + mods[i].modFileName + "-" + 
				(mods[i].subMods[j].subMods.empty()?mods[i].subMods[j].modFileName:mods[i].subMods[j].subMods[0].modFileName) + SUF);
			subModItem = regex_replace(subModItem, regex("@subModName"), mods[i].subMods[j].modName);
			headItem = regex_replace(headItem, regex("@subModItemPoint"), subModItem);
		}
		htmlTemp = regex_replace(htmlTemp, regex("@headItemPoint"), headItem);
	}
	return htmlTemp;
}
//编写子模块和子子模块(有的话) 
string getModHTML(Mod mod,int subModIdx,int subsubModIdx,string htmlTemp,string selectItemTemp){
	smatch subsublistsm,menuSignsm;
	string subsublistTemp,menuSignTemp;
	htmlTemp = regex_replace(htmlTemp,regex(selectItemTemp),"@selectItemPoint");
	htmlTemp = regex_replace(htmlTemp,regex("@modFirstName"),mod.modName.substr(0,2));
	htmlTemp = regex_replace(htmlTemp,regex("@modName"),mod.modName);
	regex_search(selectItemTemp,subsublistsm,regex("@subsubList[\\s\\S]*@/subsubList"));
	subsublistTemp = subsublistsm[0];
	selectItemTemp = regex_replace(selectItemTemp,regex(subsublistTemp),"@subsubListPoint");
	regex_search(selectItemTemp,menuSignsm,regex("@menuSign[\\s\\S]*@/menuSign"));
	menuSignTemp = menuSignsm[0];
	selectItemTemp = regex_replace(selectItemTemp,regex("@menuSign[\\s\\S]*@/menuSign"),"@menuSignPoint");
	for(int i = 0;i < mod.subMods.size();i++){
		string selectItem = selectItemTemp;
		bool isMenu = mod.subMods[i].subMods.empty()==false;
		bool isThisSubMod = i==subModIdx;
		cout << isThisSubMod << " "; 
		selectItem = regex_replace(selectItem,regex("@select-ItemClass"),isMenu?(isThisSubMod?"menu active":"menu"):"select-item");
		selectItem = regex_replace(selectItem,regex("@subModLink"),isMenu?"javascript:;":PRE + mod.modFileName + "-" + mod.subMods[i].modFileName + SUF);
		//如果有子子模块就添加类fa,其中如果还是当前编写的模块页，就添加类active，如果没有子子模块，就判断是否是当前编写的模块页，如果是就添加类selected 
		selectItem = regex_replace(selectItem,regex("@subMod-LinkClass"),isMenu?(isThisSubMod?" fa open":" fa"):(isThisSubMod?" selected":""));
		selectItem = regex_replace(selectItem,regex("@subModFirstName"),mod.subMods[i].modName.substr(0,2));
		selectItem = regex_replace(selectItem,regex("@subModName"),mod.subMods[i].modName);
		selectItem = regex_replace(selectItem,regex("@menuSignPoint"),isMenu?menuSignTemp:"");
		if(isMenu){		//添加子子模块列表 
			string subsublist = subsublistTemp,subsubitemTemp;
			smatch subsubitemsm;
			regex_search(subsublist,subsubitemsm,regex("@subsubItem[\\s\\S]*@/subsubItem"));
			subsubitemTemp = subsubitemsm[0];
			subsublist = regex_replace(subsublist,regex("@subsubItem[\\s\\S]*@/subsubItem"),"@subsubItemPoint");
			for(int j = 0;j < mod.subMods[i].subMods.size();j++){
				bool isThisSubsubMod = j==subsubModIdx;
				string subsubItem = subsubitemTemp;
				subsubItem = regex_replace(subsubItem,regex("@subsubModLink"),PRE + mod.modFileName + "-" + mod.subMods[i].subMods[j].modFileName + SUF);
				subsubItem = regex_replace(subsubItem,regex("@selected"),isThisSubsubMod?" selected":"");
				subsubItem = regex_replace(subsubItem,regex("@subsubModFirstName"),mod.subMods[i].subMods[j].modName.substr(0,2));
				subsubItem = regex_replace(subsubItem,regex("@subsubModName"),mod.subMods[i].subMods[j].modName);
				subsublist = regex_replace(subsublist,regex("@subsubItemPoint"),subsubItem);
				subsublist = regex_replace(subsublist,regex("@/subsubItem"),"@subsubItemPoint");
			} 
			selectItem = regex_replace(selectItem,regex("@subsubListPoint"),subsublist);
		}
		else{
			selectItem = regex_replace(selectItem,regex("@subsubListPoint"),"");		//可去掉，反正最后也会整体去除标记 
		}
		selectItem = regex_replace(selectItem,regex("@/selectItem"),"@selectItemPoint");
		htmlTemp = regex_replace(htmlTemp,regex("@selectItemPoint"),selectItem);
	}
	return htmlTemp;
}
void createAllHTMLFile(string htmlTemp, vector<Mod> mods) {
	FILE* fp;
	smatch selectItem;
	smatch headItem;
	regex_search(htmlTemp, selectItem, regex("@selectItem[\\s\\S]*@/selectItem"));
	regex_search(htmlTemp, headItem, regex("@headItem[\\s\\S]*@/headItem"));
	//cout << htmlTemp << endl;
	string modHTML = getModsHTML(mods, htmlTemp, selectItem[0], headItem[0]);
	for (int i = 0; i < mods.size(); i++) {
		for (int j = 0; j < mods[i].subMods.size(); j++) {
			//添加selected类
			if(mods[i].subMods[j].subMods.empty()){
				string subModHTML = getModHTML(mods[i],j,-1,modHTML,selectItem[0]);
				fp = fopen((mods[i].modFileName + "-" + mods[i].subMods[j].modFileName + SUF).c_str(), "w+");
				subModHTML = regex_replace(subModHTML,regex("@/?\\w+-?\\w*"),"");
				subModHTML.append(foot);
				fprintf(fp, "%s", G2U(subModHTML.c_str()));
				fclose(fp);
			}
			else{
				for(int k = 0;k < mods[i].subMods[j].subMods.size();k++){
					string subModHTML = getModHTML(mods[i],j,k,modHTML,selectItem[0]);
					fp = fopen((mods[i].modFileName + "-" + mods[i].subMods[j].subMods[k].modFileName + SUF).c_str(), "w+");
					subModHTML = regex_replace(subModHTML,regex("@/?\\w+-?\\w*"),"");
					subModHTML.append(foot);
					fprintf(fp, "%s", G2U(subModHTML.c_str()));
					fclose(fp);
				}
			}
		}
	}
}
