package com.yagn.nadrii.service.domain;

import java.sql.Date;
import java.util.Arrays;

public class Purchase {
	
	/// Field
	private int contentId;			
	private int contentTypeId;		

	private int contentid;			
	private int contenttypeid;		

	private int postNo;			
	private String ticketTitle;		
	private String ticketImage;		
	private Date regDate;			
	private String bookingDate;		
	private String cancelDate;	
	private String ticketPriceAll;
	private String flag; 
	
	private String[] ticketCount;
	private String[] ticketPrice;
	
	private int totalTicketPrice;
	private double taxFree;
	private int ticketPayment;
	
	private String buyerId;
	private String buyerName;
	private String buyerPhone;
	private String buyerEmail;
	
	
	
	private User buyer;
	
	public Purchase() {
		
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public int getContentTypeId() {
		return contentTypeId;
	}

	public void setContentTypeId(int contentTypeId) {
		this.contentTypeId = contentTypeId;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getTicketTitle() {
		return ticketTitle;
	}

	public void setTicketTitle(String ticketTitle) {
		this.ticketTitle = ticketTitle;
	}

	public String getTicketImage() {
		return ticketImage;
	}

	public void setTicketImage(String ticketImage) {
		this.ticketImage = ticketImage;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}

	public String getTicketPriceAll() {
		return ticketPriceAll;
	}

	public void setTicketPriceAll(String ticketPriceAll) {
		this.ticketPriceAll = ticketPriceAll;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String[] getTicketCount() {
		return ticketCount;
	}

	public void setTicketCount(String[] ticketCount) {
		this.ticketCount = ticketCount;
	}

	public String[] getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(String[] ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public int getTotalTicketPrice() {
		return totalTicketPrice;
	}

	public void setTotalTicketPrice(int totalTicketPrice) {
		this.totalTicketPrice = totalTicketPrice;
	}

	public User getBuyer() {
		return buyer;
	}

	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getBuyerPhone() {
		return buyerPhone;
	}

	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}
	
	

	public int getContentid() {
		return contentid;
	}

	public void setContentid(int contentid) {
		this.contentid = contentid;
	}

	public int getContenttypeid() {
		return contenttypeid;
	}

	public void setContenttypeid(int contenttypeid) {
		this.contenttypeid = contenttypeid;
	}

	public double getTaxFree() {
		return taxFree;
	}

	public void setTaxFree(double taxFree) {
		this.taxFree = taxFree;
	}

	public int getTicketPayment() {
		return ticketPayment;
	}

	public void setTicketPayment(int ticketPayment) {
		this.ticketPayment = ticketPayment;
	}

	@Override
	public String toString() {
		return "Purchase [contentId=" + contentId + ", contentTypeId=" + contentTypeId + ", contentid=" + contentid
				+ ", contenttypeid=" + contenttypeid + ", postNo=" + postNo + ", ticketTitle=" + ticketTitle
				+ ", ticketImage=" + ticketImage + ", regDate=" + regDate + ", bookingDate=" + bookingDate
				+ ", cancelDate=" + cancelDate + ", ticketPriceAll=" + ticketPriceAll + ", flag=" + flag
				+ ", ticketCount=" + Arrays.toString(ticketCount) + ", ticketPrice=" + Arrays.toString(ticketPrice)
				+ ", totalTicketPrice=" + totalTicketPrice + ", taxFree=" + taxFree + ", ticketPayment=" + ticketPayment
				+ ", buyerId=" + buyerId + ", buyerName=" + buyerName + ", buyerPhone=" + buyerPhone + ", buyerEmail="
				+ buyerEmail + ", buyer=" + buyer + "]";
	}

	
	
	
	
	
}
