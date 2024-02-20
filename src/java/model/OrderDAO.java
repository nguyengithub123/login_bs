/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Orders;
import entity.OrderDetails;
import java.util.ArrayList;
import java.util.List;


public class OrderDAO extends MyDAO {

    public List<Orders> getOrders(){
        List<Orders> list = new ArrayList<>();
        String sql = "select * from Orders";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Orders(rs.getString(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getDate(5), rs.getLong(6)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<OrderDetails> getDetails(){
        List<OrderDetails> list = new ArrayList<>();
        String sql = "select * from OrderDetails";
        try {       
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetails(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDouble(5)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
        }
        return list;
    }
    
}
