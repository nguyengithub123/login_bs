package model;

import entity.Customers;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thinh Nguyen
 */
public class CustomerDAO extends MyDAO {

    public List<Customers> getCustomers() {
        List<Customers> customersList = new ArrayList<>();
        xSql = "SELECT * FROM [dbo].[Customers]";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String userID = rs.getString("userID");
                String fullName = rs.getString("fullname");
                String username = rs.getString("username");
                String userpassword = rs.getString("userpassword");
                String userEmail = rs.getString("userEmail");

                Customers customer = new Customers(userID, fullName, username, userpassword, userEmail);
                customersList.add(customer);
            }

            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customersList;
    }

}
