package cn.lingnan.pojo;

import org.springframework.stereotype.Component;

@Component("menu")
public class Menu {
    private Integer menuId;
    private String menuName;
    private String menuCategory;
    private Integer menuStatus;
    private Integer price;
    private String picture;

    public Menu(){

    }
    public Menu(Integer menuId, String menuName, String menuCategory, Integer menuStatus, Integer price, String picture){
        this.menuId = menuId;
        this.menuName = menuName;
        this.menuCategory = menuCategory;
        this.menuStatus = menuStatus;
        this.price = price;
        this.picture = picture;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuCategory() {
        return menuCategory;
    }

    public void setMenuCategory(String menuCategory) {
        this.menuCategory = menuCategory;
    }

    public Integer getMenuStatus() {
        return menuStatus;
    }

    public void setMenuStatus(Integer menuStatus) {
        this.menuStatus = menuStatus;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    @Override
    public String toString() {
        return "menu{" +
                "menuId=" + menuId +
                ", menuName='" + menuName + '\'' +
                ", menuCategory='" + menuCategory + '\'' +
                ", menuStatus=" + menuStatus +
                ", price=" + price +
                ", picture='" + picture + '\'' +
                '}';
    }
}

