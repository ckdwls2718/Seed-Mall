package com.my.seedmall;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.user.model.SalesDTO;
import com.user.service.AdminHistoryService;

import lombok.extern.log4j.Log4j;

@Controller
//@RequestMapping("/admin")
@Log4j
public class AdminHistoryController {
	
	@Autowired
	AdminHistoryService historyService;
	

	@GetMapping("/history")
	public String history(Model m, @RequestParam(value="year", defaultValue = "0") int year, 
			@RequestParam(value="month", defaultValue = "0") int month){
		log.info("adminPage");
		if(year == 0) {
			year = LocalDate.now().getYear();
		}
		
		if(month == 0) {
			month = LocalDate.now().getMonthValue();
		}
		
		//List<Long> salesDay = Stream.of(0L,0L,0L,0L,0L,0L,0L,0L,0L,0L,0L,0L).collect(Collectors.toList());

		List<SalesDTO> salesArr = historyService.getSales(year);
		
		log.info("salesArr = "+salesArr);
		
		
		//일매출
		
		
		
		//월매출
		Map<Integer, Long> map = new TreeMap<>();

		for(SalesDTO sales :salesArr) {
			Integer month2 = Integer.valueOf(sales.getToChar().substring(4,6));
			map.put(month2, map.getOrDefault(month2, 0L)+sales.getTotalPrice());
		}
		
		List<Long> salesMonth = new ArrayList<>(map.values());
		
		//연매출
		Long salesYear = salesArr.stream().mapToLong(dto -> dto.getTotalPrice()).sum();
		m.addAttribute("year", year);
		m.addAttribute("month", month);
		m.addAttribute("salesYear", salesYear);
		m.addAttribute("salesMonth", salesMonth);
		return "history";
	}
}
