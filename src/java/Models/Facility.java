/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Hieu
 */
public class Facility {

    private int facilityId;
    private String name;
    private int status;
    private String icon;

    public Facility(int facilityId, String name, int status, String icon) {
        this.facilityId = facilityId;
        this.name = name;
        this.status = status;
        this.icon = icon;
    }

    public Facility(String name, int status, String icon) {
        this.name = name;
        this.status = status;
        this.icon = icon;
    }

    public Facility(int facilityId, String name, int status) {
        this.facilityId = facilityId;
        this.name = name;
        this.status = status;
    }

    public Facility() {
    }

    public int getFacilityId() {
        return facilityId;
    }

    public void setFacilityId(int facilityId) {
        this.facilityId = facilityId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

}
