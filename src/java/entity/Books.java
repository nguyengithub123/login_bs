/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Nguyen
 */
import java.sql.Date;
import java.util.List;

public class Books {

    private String bookID;
    private String bookName;
    private String authorName;
    private String publisherName;
    private List<Genres> genres;
    private Date publisherDate;
    private double price;
    private int quantity;
    private String detailbook;
    private String img_1;
    private String img_2;
    private String img_3;
    private String img_4;

    public Books() {
    }

    public Books(String bookID, String bookName, String authorName, String publisherName, List<Genres> genres, Date publisherDate, double price, int quantity, String detailbook, String img_1, String img_2, String img_3, String img_4) {
        this.bookID = bookID;
        this.bookName = bookName;
        this.authorName = authorName;
        this.publisherName = publisherName;
        this.genres = genres;
        this.publisherDate = publisherDate;
        this.price = price;
        this.quantity = quantity;
        this.detailbook = detailbook;
        this.img_1 = img_1;
        this.img_2 = img_2;
        this.img_3 = img_3;
        this.img_4 = img_4;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public List<Genres> getGenres() {
        return genres;
    }

    public void setGenres(List<Genres> genres) {
        this.genres = genres;
    }

    public Date getPublisherDate() {
        return publisherDate;
    }

    public void setPublisherDate(Date publisherDate) {
        this.publisherDate = publisherDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDetailbook() {
        return detailbook;
    }

    public void setDetailbook(String detailbook) {
        this.detailbook = detailbook;
    }

    public String getImg_1() {
        return img_1;
    }

    public void setImg_1(String img_1) {
        this.img_1 = img_1;
    }

    public String getImg_2() {
        return img_2;
    }

    public void setImg_2(String img_2) {
        this.img_2 = img_2;
    }

    public String getImg_3() {
        return img_3;
    }

    public void setImg_3(String img_3) {
        this.img_3 = img_3;
    }

    public String getImg_4() {
        return img_4;
    }

    public void setImg_4(String img_4) {
        this.img_4 = img_4;
    }

   
    
}
