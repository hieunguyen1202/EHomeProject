/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import jakarta.servlet.http.Part;

/**
 *
 * @author Hieu
 */
public class House {

    private int houseId;
    private String name;
    private int wardId;
    private String address;
    private String disableTime;
    private int status;
    private String image;
    private int houseTypeId;
    private String updateTime;
    private String map;
    private int buildingId;
    private String ownerId;

    public House() {
    }

    public House(int houseId, String name, String address, int status, String image) {
        this.houseId = houseId;
        this.name = name;
        this.address = address;
        this.status = status;
        this.image = image;
    }

    public House(int houseId, String name, int wardId, String address, String disableTime, int status, String image, int houseTypeId, String updateTime, String map, int buildingId, String ownerId) {
        this.houseId = houseId;
        this.name = name;
        this.wardId = wardId;
        this.address = address;
        this.disableTime = disableTime;
        this.status = status;
        this.image = image;
        this.houseTypeId = houseTypeId;
        this.updateTime = updateTime;
        this.map = map;
        this.buildingId = buildingId;
        this.ownerId = ownerId;
    }

    public House(int houseId, String name, int wardId, String address, int status, String image, int houseTypeId, String map, int buildingId, String ownerId) {
        this.houseId = houseId;
        this.name = name;
        this.wardId = wardId;
        this.address = address;
        this.status = status;
        this.image = image;
        this.houseTypeId = houseTypeId;
        this.map = map;
        this.buildingId = buildingId;
        this.ownerId = ownerId;
    }

    public House(String name, int wardId, String address, int status, String image, int houseTypeId, String map, int buildingId, String ownerId) {
        this.name = name;
        this.wardId = wardId;
        this.address = address;
        this.status = status;
        this.image = image;
        this.houseTypeId = houseTypeId;
        this.map = map;
        this.buildingId = buildingId;
        this.ownerId = ownerId;
    }

    public House(String name, String image) {
        this.name = name;
        this.image = image;
    }

    public House(int houseId, String name, int wardId, String address, int status, String map, String image, int houseTypeId, int buildingId) {
        this.houseId = houseId;
        this.name = name;
        this.wardId = wardId;
        this.address = address;
        this.status = status;
        this.houseTypeId = houseTypeId;
        this.map = map;
        this.image = image;
        this.buildingId = buildingId;
    }

    public House(int houseId, String name, String image) {
        this.houseId = houseId;
        this.name = name;
        this.image = image;

    }

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getWardId() {
        return wardId;
    }

    public void setWardId(int wardId) {
        this.wardId = wardId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDisableTime() {
        return disableTime;
    }

    public void setDisableTime(String disableTime) {
        this.disableTime = disableTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getHouseTypeId() {
        return houseTypeId;
    }

    public void setHouseTypeId(int houseTypeId) {
        this.houseTypeId = houseTypeId;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getMap() {
        return map;
    }

    public void setMap(String map) {
        this.map = map;
    }

    public int getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(int buildingId) {
        this.buildingId = buildingId;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

}
