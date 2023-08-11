package com.spring.proj.domain.basket;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;




@Data
public class BasketVO {	// javaBean
	private int s_no;
	private int um_no;
	private int p_pno;
	private int s_quantity;
	private Date s_date;
	// 검색 기능 추가
	private String searchCondition;
	private String searchKeyword;
	// 파일 업로드 추가
	private MultipartFile uploadFile;
	
	
	private String p_detail;
	private int p_price;
	private String p_pimg;
	private String p_dimg;
	private String p_name;
}
