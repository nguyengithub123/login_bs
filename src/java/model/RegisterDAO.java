package model;

import java.sql.SQLException;

/**
 *
 * @author Thinh Nguyen
 */
public class RegisterDAO extends MyDAO {

    // Kiểm tra username có trùng lặp
    public boolean checkUsernameExists(String username) {
        boolean exists = false;
        try {
            xSql = "SELECT * FROM [dbo].[Customers] WHERE username=?";
            ps = con.prepareStatement(xSql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                exists = true;
            }
            ps.close();
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }

    // Kiểm tra email có trùng lặp ko
    public boolean checkEmailExists(String email) {
        boolean exists = false;
        try {
            xSql = "SELECT * FROM [dbo].[Customers] WHERE userEmail=?";
            ps = con.prepareStatement(xSql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                exists = true;
            }
            ps.close();
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }

    // Thêm người dùng mới vào cơ sở dữ liệu
    public void addUser(String username, String fullname, String email, String password) {
        String xSql = "INSERT INTO dbo.Customers (userID, fullname, username, userpassword, userEmail, userRole) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            String getLastUserIDSql = "SELECT TOP 1 userID FROM dbo.Customers ORDER BY userID DESC";
            ps = con.prepareStatement(getLastUserIDSql);
            rs = ps.executeQuery();
            int lastUserIDNumber = 0;
            if (rs.next()) {
                String lastUserID = rs.getString("userID");
                // Trích xuất số thứ tự từ userID cuối cùng
                lastUserIDNumber = Integer.parseInt(lastUserID.substring(1));
            }

            String newUserID = "U" + String.format("%03d", lastUserIDNumber + 1);

            ps = con.prepareStatement(xSql);
            ps.setString(1, newUserID);
            ps.setString(2, fullname);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setString(5, email);
            ps.setString(6, "customer"); // Set giá trị mặc định cho cột userRole

            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
