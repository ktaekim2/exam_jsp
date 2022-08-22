package com.ex.ex1.model;

public class ExDTO {
	private String data1;
	private String data2;
	
	// lombok이 없으므로.....
	
	public String getData1() {
		return data1;
	}
	public void setData1(String data1) {
		this.data1 = data1;
	}
	public String getData2() {
		return data2;
	}
	public void setData2(String data2) {
		this.data2 = data2;
	}
	
	@Override
	public String toString() {
		return "ExDTO [data1=" + data1 + ", data2=" + data2 + "]";
	}
	
	
}
