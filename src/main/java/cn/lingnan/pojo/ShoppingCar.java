package cn.lingnan.pojo;

public class ShoppingCar {
    private Integer menuId;
    private Integer price;
    private Integer count;

    public ShoppingCar() {
    }

    public ShoppingCar(Integer menuId, Integer price, Integer count) {
        this.menuId = menuId;
        this.price = price;
        this.count = count;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "ShoppingCar{" +
                "menuId=" + menuId +
                ", price=" + price +
                ", count=" + count +
                '}';
    }
}
