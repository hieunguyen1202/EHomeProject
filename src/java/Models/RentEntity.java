/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Hieu
 */
public class RentEntity {

    private int rentEntityId;
    private String name;
    private String description;
    private int rentTypeId;
    private int houseId;
    private int price;
    private int area;
    private String image;
    private int status;
    private String createTime;
    private int maxPeople;
    private String depositBy;
    private String depositTime;
    private String updateBy;

    public RentEntity() {
    }

    public RentEntity(int rentEntityId, String name, String description, int rentTypeId, int houseId, int price, int area, String image, int status, String createTime, int maxPeople, String depositBy, String depositTime, String updateBy) {
        this.rentEntityId = rentEntityId;
        this.name = name;
        this.description = description;
        this.rentTypeId = rentTypeId;
        this.houseId = houseId;
        this.price = price;
        this.area = area;
        this.image = image;
        this.status = status;
        this.createTime = createTime;
        this.maxPeople = maxPeople;
        this.depositBy = depositBy;
        this.depositTime = depositTime;
        this.updateBy = updateBy;
    }

    public RentEntity(String name, String description, int rentTypeId, int houseId, int price, int area, String image, int status, int maxPeople, int rentEntityId, String updateBy) {
        this.name = name;
        this.description = description;
        this.rentTypeId = rentTypeId;
        this.houseId = houseId;
        this.price = price;
        this.area = area;
        this.image = image;
        this.status = status;
        this.maxPeople = maxPeople;
        this.rentEntityId = rentEntityId;
        this.updateBy = updateBy;
    }

    public RentEntity(String name, String description, int rentTypeId, int houseId, int price, int area, String image, int status, int maxPeople, int rentEntityId) {
        this.name = name;
        this.description = description;
        this.rentTypeId = rentTypeId;
        this.houseId = houseId;
        this.price = price;
        this.area = area;
        this.image = image;
        this.status = status;
        this.maxPeople = maxPeople;
        this.rentEntityId = rentEntityId;
    }

    public RentEntity(String name, String description, int rentTypeId, int houseId, int price, int area, String image, int status, String createTime, int maxPeople, String updateBy) {
        this.name = name;
        this.description = description;
        this.rentTypeId = rentTypeId;
        this.houseId = houseId;
        this.price = price;
        this.area = area;
        this.image = image;
        this.status = status;
        this.createTime = createTime;
        this.maxPeople = maxPeople;
        this.updateBy = updateBy;
    }

    public RentEntity(String name, String description, int rentTypeId, int houseId, int price, int area, String image, int maxPeople) {
        this.name = name;
        this.description = description;
        this.rentTypeId = rentTypeId;
        this.houseId = houseId;
        this.price = price;
        this.area = area;
        this.image = image;
        this.maxPeople = maxPeople;
    }

    public RentEntity(int rentEntityId, String name, String description, int rentTypeId, int houseId, int price, int area, String image, int maxPeople) {
        this.rentEntityId = rentEntityId;
        this.name = name;
        this.description = description;
        this.rentTypeId = rentTypeId;
        this.houseId = houseId;
        this.price = price;
        this.area = area;
        this.image = image;
        this.maxPeople = maxPeople;
    }

    public int getRentEntityId() {
        return rentEntityId;
    }

    public void setRentEntityId(int rentEntityId) {
        this.rentEntityId = rentEntityId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public int getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(int maxPeople) {
        this.maxPeople = maxPeople;
    }

    public String getDepositBy() {
        return depositBy;
    }

    public void setDepositBy(String depositBy) {
        this.depositBy = depositBy;
    }

    public String getDepositTime() {
        return depositTime;
    }

    public void setDepositTime(String depositTime) {
        this.depositTime = depositTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

}
