package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.model.FAQVO;
import com.board.service.FAQService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FAQController {
	@Autowired
	FAQService faqService;
	
	@GetMapping("/FAQ/{fnum}")
    public String FAQlist(@PathVariable("fnum") String fnum,@RequestParam(defaultValue="0") int index,Model m) {
		//log.info("fnum===="+fnum+", index==="+index);
		List<FAQVO> FAQArr=null;
		if(fnum==null) {
			fnum="all";
			FAQArr=this.faqService.getFAQList();
		}
		if(fnum.equals("all")) {
			FAQArr=this.faqService.getFAQList();
		}else {
			FAQArr=this.faqService.getFAQListByFnum(fnum);
		}
		//log.info(FAQArr);
		
		m.addAttribute("FAQArr", FAQArr);
		m.addAttribute("menuIndex",index);
		
        return "board/FAQ";
    }
	@GetMapping("/FAQ")
    public String FAQlistAll(Model m) {
		List<FAQVO> FAQArr=null;
		
			FAQArr=this.faqService.getFAQList();
		
		//log.info(FAQArr);
		
		m.addAttribute("FAQArr", FAQArr);
		
        return "board/FAQ";
    }
}
