/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;


/**
 *
 * @author Nguyen
 */
import java.util.Date;

public class Orders {

    private String orderID;
    private String userID;
    private double total;
    private String userAddress;
    private Date billDate;
    private long userPhone;

    public Orders() {
    }

    public Orders(String orderID, String userID, double total, String userAddress, Date billDate, long userPhone) {
        this.orderID = orderID;
        this.userID = userID;
        this.total = total;
        this.userAddress = userAddress;
        this.billDate = billDate;
        this.userPhone = userPhone;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public Date getBillDate() {
        return billDate;
    }

    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }

    public long getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(long userPhone) {
        this.userPhone = userPhone;
    }

   
}
