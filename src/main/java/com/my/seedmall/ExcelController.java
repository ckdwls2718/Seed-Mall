package com.my.seedmall;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.product.mapper.ProductMapper;
import com.product.model.ProductForm;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class ExcelController {
	
	@Autowired
	ProductMapper prodMapper;
	
	@GetMapping("/excel")
	public String excelForm() {
		
		return "product/excel";
	}
	@PostMapping("/excel")
	public String insertExcel(@RequestParam("excel") MultipartFile mf, HttpServletRequest req) {
		ServletContext app = req.getServletContext();
		String upDir = app.getRealPath("/resources/excel");
		String originalName = mf.getOriginalFilename();
		
		File file = new File(upDir, originalName);
		
		try {
			mf.transferTo(file);
			// Workbook 내용 읽기
			FileInputStream fis =  new FileInputStream(new File(upDir+"/"+originalName));
			XSSFWorkbook workbook = new XSSFWorkbook(fis);
			XSSFSheet sheet = workbook.getSheetAt(0);
			int totalRowCount = sheet.getPhysicalNumberOfRows();

			log.info("totalRowCount ="+totalRowCount);
			
			DataFormatter formatter = new DataFormatter();
			
			for(int rowIndex=1; rowIndex<totalRowCount; rowIndex++) {
				Row row = sheet.getRow(rowIndex);
				if(row != null) {
					int totalCellCount = row.getPhysicalNumberOfCells();
					ProductForm prod = new ProductForm();
					for(int cellIndex=0; cellIndex<=totalCellCount; cellIndex++) {
						Cell cell = row.getCell(cellIndex);
						if(cell != null) {
							String value = formatter.formatCellValue(cell);
							
							switch(cellIndex) {
								case 0: prod.setUpCg_code(value);
										break;
								case 1: prod.setDownCg_code(value);
										break;
								case 2: prod.setPname(value);
										break;
								case 3: prod.setSun(value);
										break;
								case 4: prod.setTemp(value);
										break;
								case 5: prod.setSoil(value);
										break;
								case 6: prod.setPrice(Integer.valueOf(value));
										break;
								case 7: prod.setPsaleprice(Integer.valueOf(value));
										break;
							}
						}
					}
					prod.setPcontent("내용을 입력해주세요");
					prod.setPspec("NEW");
					prod.setPqty(50);
					prod.setPpoint((int)(prod.getPsaleprice()*0.1));
					
					prodMapper.productInsert(prod);
				}
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "product/excel";
	}

}
