/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Hieu
 */
public class HouseType {
    private int houseTypeId;
    private String name;

    public HouseType() {
    }

    public HouseType(int houseTypeId, String name) {
        this.houseTypeId = houseTypeId;
        this.name = name;
    }

    public int getHouseTypeId() {
        return houseTypeId;
    }

    public void setHouseTypeId(int houseTypeId) {
        this.houseTypeId = houseTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
