package model;

import entity.Customers;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thinh
 */
public class LoginDAO extends MyDAO {

    public List<Customers> getCustomers() {
        List<Customers> t = new ArrayList<>();
        xSql = "select * from dbo.Customers";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            String userID, fullName, username, userpassword, userEmail, userRole;
            Customers x;
            while (rs.next()) {
                userID = rs.getString("userID");
                fullName = rs.getString("fullName");
                username = rs.getString("username");
                userpassword = rs.getString("userpassword");
                userEmail = rs.getString("userEmail");
                userRole = rs.getString("userRole");

                x = new Customers(userID, fullName, username, userpassword, userEmail, userRole);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return (t);
    }

    public boolean authenticate(String username, String password) {
        String sql = "SELECT * FROM dbo.Customers WHERE username=? AND userpassword=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Nếu có bản ghi khớp, tức là người dùng tồn tại và thông tin đăng nhập hợp lệ
                rs.close();
                ps.close();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Nếu không có bản ghi khớp hoặc có lỗi xảy ra, trả về false
        return false;
    }

    public String getUserRole(String username) {
        String userRole = null;
        String sql = "SELECT userRole FROM dbo.Customers WHERE username=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                userRole = rs.getString("userRole");
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userRole;
    }

}
