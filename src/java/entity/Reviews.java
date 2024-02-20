/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;



/**
 *
 * @author Nguyen
 */
public class Reviews {

    private String reviewID;
    private String bookId;
    private String userID;
    private double rating;
    private String comment;

    public Reviews() {
    }

    public Reviews(String reviewID, String bookId, String userID, double rating, String comment) {
        this.reviewID = reviewID;
        this.bookId = bookId;
        this.userID = userID;
        this.rating = rating;
        this.comment = comment;
    }
    

    public String getReviewID() {
        return reviewID;
    }

    public void setReviewID(String reviewID) {
        this.reviewID = reviewID;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
    
}
