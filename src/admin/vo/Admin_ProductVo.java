package admin.vo;

import java.sql.Date;

public class Admin_ProductVo {
	private int pid;
	private int pprice;
	private int pdiscount;
	private String pimage1;
	private String pimage2;
	private String pimage3;
	private Date prdate;
	private int pamount;
	private int psell;
	public Admin_ProductVo(int pid, int pprice, int pdiscount, String pimage1, String pimage2, String pimage3,
			Date prdate, int pamount, int psell) {
		super();
		this.pid = pid;
		this.pprice = pprice;
		this.pdiscount = pdiscount;
		this.pimage1 = pimage1;
		this.pimage2 = pimage2;
		this.pimage3 = pimage3;
		this.prdate = prdate;
		this.pamount = pamount;
		this.psell = psell;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getPdiscount() {
		return pdiscount;
	}
	public void setPdiscount(int pdiscount) {
		this.pdiscount = pdiscount;
	}
	public String getPimage1() {
		return pimage1;
	}
	public void setPimage1(String pimage1) {
		this.pimage1 = pimage1;
	}
	public String getPimage2() {
		return pimage2;
	}
	public void setPimage2(String pimage2) {
		this.pimage2 = pimage2;
	}
	public String getPimage3() {
		return pimage3;
	}
	public void setPimage3(String pimage3) {
		this.pimage3 = pimage3;
	}
	public Date getPrdate() {
		return prdate;
	}
	public void setPrdate(Date prdate) {
		this.prdate = prdate;
	}
	public int getPamount() {
		return pamount;
	}
	public void setPamount(int pamount) {
		this.pamount = pamount;
	}
	public int getPsell() {
		return psell;
	}
	public void setPsell(int psell) {
		this.psell = psell;
	}
}
