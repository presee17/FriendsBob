package com.mycompany.myapp.dto;

public class Search {
	private String address1;
	private String address2;
	private String foodKind[] = new String[5];
	private String search;

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String[] getFoodKind() {
		return foodKind;
	}

	public void setFoodKind(String[] foodKind) {
		this.foodKind = foodKind;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
}
