package com.itheima.model;

import java.io.Serializable;

public class BenchmarkData implements Serializable {

    /**
     * 基准备资料
     *
     * 成品基础信息表
     */

    private int id;                     // 序号

    private String kangMingId;                  //  康明编号

    private String packingStandard;               //  装箱标准（箱/只）

    private String grossWeightOfEachBox;       // 每箱毛重（公斤）

    private String tankSize;                   // 箱尺寸（cm）

    private String aStandardCardBoardBox;         // 卡板标准 （卡板/箱）

    private String aStandardCardBoardLongWide;    //  卡板标准 长*宽

    private String instructions;               //  说明

    private int benchmarkDataVersionNumber;    //  乐观锁， 对数据update 操作    ********************

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKangMingId() {
        return kangMingId;
    }

    public void setKangMingId(String kangMingId) {
        this.kangMingId = kangMingId;
    }

    public String getPackingStandard() {
        return packingStandard;
    }

    public void setPackingStandard(String packingStandard) {
        this.packingStandard = packingStandard;
    }

    public String getGrossWeightOfEachBox() {
        return grossWeightOfEachBox;
    }

    public void setGrossWeightOfEachBox(String grossWeightOfEachBox) {
        this.grossWeightOfEachBox = grossWeightOfEachBox;
    }

    public String getTankSize() {
        return tankSize;
    }

    public void setTankSize(String tankSize) {
        this.tankSize = tankSize;
    }

    public String getaStandardCardBoardBox() {
        return aStandardCardBoardBox;
    }

    public void setaStandardCardBoardBox(String aStandardCardBoardBox) {
        this.aStandardCardBoardBox = aStandardCardBoardBox;
    }

    public String getaStandardCardBoardLongWide() {
        return aStandardCardBoardLongWide;
    }

    public void setaStandardCardBoardLongWide(String aStandardCardBoardLongWide) {
        this.aStandardCardBoardLongWide = aStandardCardBoardLongWide;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public int getBenchmarkDataVersionNumber() {
        return benchmarkDataVersionNumber;
    }

    public void setBenchmarkDataVersionNumber(int benchmarkDataVersionNumber) {
        this.benchmarkDataVersionNumber = benchmarkDataVersionNumber;
    }

    @Override
    public String toString() {
        return "BenchmarkData{" +
                "id=" + id +
                ", kangMingId='" + kangMingId + '\'' +
                ", packingStandard='" + packingStandard + '\'' +
                ", grossWeightOfEachBox='" + grossWeightOfEachBox + '\'' +
                ", tankSize='" + tankSize + '\'' +
                ", aStandardCardBoardBox='" + aStandardCardBoardBox + '\'' +
                ", aStandardCardBoardLongWide='" + aStandardCardBoardLongWide + '\'' +
                ", instructions='" + instructions + '\'' +
                ", benchmarkDataVersionNumber=" + benchmarkDataVersionNumber +
                '}';
    }
}
