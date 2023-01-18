package com.user.model;

import java.util.HashMap;
import java.util.Map;

import lombok.Data;

@Data
public class SalesDTO {
	private String toChar;
	private int year;
	private int month;
	private int day;
	private long totalPrice;
	
	public Map<Integer,Long> getYearTotal(){
		Map<Integer,Long> map = new HashMap<>();
		map.put(year, totalPrice);
		return map;
	}
	
}
