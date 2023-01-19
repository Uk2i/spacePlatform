package com.bigdataB.space.dto;



import lombok.Getter;
import lombok.Setter;
@Getter
@Setter

public class PayDTO {
	private int pay_no;			//결제 순번
	private int res_no;				//예약 번호
	private String pay_date;		//결제 일(sysdate)
	private int pay_m;				//결제 수단(1:현장결제,2:무통장)
	private int pay_st;				//결제상태
	private String pay_pr;		//결제금액
}
