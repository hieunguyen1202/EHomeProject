/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Hieu
 */
public class District {

    private int districId;
    private String name;
    private int cityId;

    public District() {
    }

    public District(int districId, String name, int cityId) {
        this.districId = districId;
        this.name = name;
        this.cityId = cityId;
    }

    public District(int districId, String name) {
        this.districId = districId;
        this.name = name;
    }

    public int getDistricId() {
        return districId;
    }

    public void setDistricId(int districId) {
        this.districId = districId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

}
