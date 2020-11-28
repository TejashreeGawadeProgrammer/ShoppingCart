
public class Flower {
	
	
	private String fname, fcolor,quantity;	
	public Flower() {
		super();
	}

	public Flower(String fname, String fcolor, String quantity) {
		super();
		this.fname = fname;
		this.fcolor = fcolor;
		this.quantity = quantity;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFcolor() {
		return fcolor;
	}

	public void setFcolor(String fcolor) {
		this.fcolor = fcolor;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	

}
