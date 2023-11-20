/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Hieu
 */
public class Ward {
    private int wardId;
    private String name;
    private int districtId;

    public Ward() {
    }

    public Ward(int wardId, String name, int districtId) {
        this.wardId = wardId;
        this.name = name;
        this.districtId = districtId;
    }

    public Ward(int wardId, String name) {
        this.wardId = wardId;
        this.name = name;
    }

    public int getWardId() {
        return wardId;
    }

    public void setWardId(int wardId) {
        this.wardId = wardId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDistrictId() {
        return districtId;
    }

    public void setDistrictId(int districtId) {
        this.districtId = districtId;
    }
    
}
