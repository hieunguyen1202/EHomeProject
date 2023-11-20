/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Hieu
 */
public class Building {

    private int buildingId;
    private String name;
    private int wardId;
    private String address;
    private String image;
    private String updateTime;
    private String map;
    private int status;

    public Building() {
    }

    public Building(int buildingId, String name, int wardId, String address, String image, String updateTime, String map, int status) {
        this.buildingId = buildingId;
        this.name = name;
        this.wardId = wardId;
        this.address = address;
        this.image = image;
        this.updateTime = updateTime;
        this.map = map;
        this.status = status;
    }

    public Building(String name, int wardId, String address, String image, String map, int status) {
        this.name = name;
        this.wardId = wardId;
        this.address = address;
        this.image = image;
        this.map = map;
        this.status = status;
    }

    public Building(int buildingId, String name, int wardId, String address, String image, String map, int status) {
        this.buildingId = buildingId;
        this.name = name;
        this.wardId = wardId;
        this.address = address;
        this.image = image;
        this.map = map;
        this.status = status;
    }
    public Building(int buildingId, String name, int wardId, String address,String map, int status) {
        this.buildingId = buildingId;
        this.name = name;
        this.wardId = wardId;
        this.address = address;
        this.map = map;
        this.status = status;
    }

    public Building(int buildingId, String name, String address, int status) {
        this.buildingId = buildingId;
        this.name = name;
        this.address = address;
        this.status = status;
    }

    public Building(int buildingId, String name) {
        this.buildingId = buildingId;
        this.name = name;
    }

    public int getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(int buildingId) {
        this.buildingId = buildingId;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public int getStatus() {
        return status;
    }

//    public String getStatus(int status) {
//        if (status == 0) {
//            return "Pending";
//        } else {
//            return "Available";
//        }
//    }

    public void setStatus(int status) {
        this.status = status;
    }
}
