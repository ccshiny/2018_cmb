package com.bank;

public class barBean {

	    private int num;
	    private int mean;
	    private String bank;
	    private String bankNbr;//支行编号
	    private int devicenum;
	    private String time;
	    private String areaname;
	    private double lng;
	    private double lat;
	    private double count;
	    
	    public double getCount() {
	        return count;
	    }
	    public void setCount(double count) {
	        this.count = count;
	    }
	    
	    public double getLat() {
	        return lat;
	    }
	    public void setLat(double lat) {
	        this.lat = lat;
	    }
	    
	    public double getLng() {
	        return lng;
	    }
	    public void setLng(double lng) {
	        this.lng = lng;
	    }
	    
	    public String getAreaname() {
	        return areaname;
	    }
	    public void setAreaname(String areaname) {
	        this.areaname = areaname;
	    }
	    
	    public String getBank() {
	        return bank;
	    }
	   
	    public void setBank(String bank) {
	        this.bank = bank;
	    }
	    
	    public String getBankNbr() {
	        return bankNbr;
	    }
	   
	    public void setBankNbr(String bankNbr) {
	        this.bankNbr = bankNbr;
	    }
	    
	    public String getTime() {
	        return time;
	    }
	   
	    public void setTime(String time) {
	        this.time = time;
	    }
	    public int getNum() {
	        return num;
	    }
	    public void setNum(int num) {
	        this.num = num;
	    }
	    //平均交易量mean
	    public int getMean() {
	        return mean;
	    }
	    public void setMean(int mean) {
	        this.mean = mean;
	    }
	    public int getDevicenum() {
	        return devicenum;
	    }
	    public void setDevicenum(int devicenum) {
	        this.devicenum = devicenum;
	    }
}
