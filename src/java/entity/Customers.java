package entity;

/**
 *
 * @author Thinh Nguyen
 */
public class Customers {

    protected String userID;
    protected String fullName;
    protected String username;
    protected String userpassword;
    protected String userEmail;
    protected String userRole;

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public Customers() {
    }

    public Customers(String userID, String fullName, String username, String userpassword, String userEmail, String userRole) {
        this.userID = userID;
        this.fullName = fullName;
        this.username = username;
        this.userpassword = userpassword;
        this.userEmail = userEmail;
        this.userRole = userRole;
    }

    public Customers(String userID, String fullName, String username, String userpassword, String userEmail) {
        this.userID = userID;
        this.fullName = fullName;
        this.username = username;
        this.userpassword = userpassword;
        this.userEmail = userEmail;
    }
    
}
