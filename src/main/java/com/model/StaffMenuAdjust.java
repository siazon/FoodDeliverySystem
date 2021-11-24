package com.model;

public class StaffMenuAdjust {
	
		
		private int prodId;
		private String menuCategory;
		private String itemName;
		private String itemDescription;
		private String allergies;
		private double price;
		
		
		
		
		public StaffMenuAdjust(Integer id,String menuCategory, String name, String itemDescription, String allergies,
				double price) {
			super();
			this.prodId=id;
			this.menuCategory = menuCategory;
			this.itemName = name;
			this.itemDescription = itemDescription;
			this.allergies = allergies;
			this.price = price;
		}
		public int getProdId() {
			return prodId;
		}
		public void setProdId(int prodId) {
			this.prodId = prodId;
		}
		public String getMenuCategory() {
			return menuCategory;
		}
		public void setMenuCategory(String menuCategory) {
			this.menuCategory = menuCategory;
		}
		public String getItemName() {
			return itemName;
		}
		public void setItemName(String itemName) {
			this.itemName = itemName;
		}
		public String getItemDescription() {
			return itemDescription;
		}
		public void setItemDescription(String itemDescription) {
			this.itemDescription = itemDescription;
		}
		public String getAllergies() {
			return allergies;
		}
		public void setAllergies(String allergies) {
			this.allergies = allergies;
		}
		public double getPrice() {
			return price;
		}
		public void setPrice(double price) {
			this.price = price;
		}
		
		
}