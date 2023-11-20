/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Hieu
 */
public class RentEntityType {

    private int rentTypeId;
    private String name;
    private int status;

    public RentEntityType() {
    }

    public RentEntityType(int rentTypeId, String name, int status) {
        this.rentTypeId = rentTypeId;
        this.name = name;
        this.status = status;
    }

    public RentEntityType(int rentTypeId, String name) {
        this.rentTypeId = rentTypeId;
        this.name = name;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
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

}
