package model;

import entity.Books;
import entity.Genres;
import entity.Reviews;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class productDAO extends MyDAO {

    public List<Books> getProduct() {
    List<Books> list = new ArrayList<>();
    String xSQL = "select b.*, g.genreName from Books b join GenreBooks gb on b.bookID = gb.bookID join Genres g on gb.genreID = g.genreID";
    List<Genres> g = new ArrayList<>();
    try {
        ps = con.prepareStatement(xSQL);
        rs = ps.executeQuery();
        while (rs.next()) {
            g.add(new Genres(rs.getString(13)));
            list.add(new Books(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),g, rs.getDate(5), rs.getDouble(6),
                    rs.getInt(7), rs.getString(8),rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12)));
        }
        rs.close();;
        ps.close();;
    } catch (SQLException e) {
        e.printStackTrace();;
    }
    return list;
}

    public List<Genres> getGenres() {
        List<Genres> list = new ArrayList<>();
        String sql = "select distinct genreID, genreName from Genres";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Genres(rs.getString(1), rs.getString(2)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
   /* 
    public void updateProduct(Books book) {
        try {
            ps = conn.prepareStatement("UPDATE Books SET bookName=?, authorName=?, publisherName=?, publisherDate=?, price=?, quantity=?, detailbook=? WHERE bookID=?");
            ps.setString(1, book.getBookName());
            ps.setString(2, book.getAuthorName());
            ps.setString(3, book.getPublisherName());
            ps.setDate(4, book.getPublisherDate());
            ps.setDouble(5, book.getPrice());
            ps.setInt(6, book.getQuantity());
            ps.setString(7, book.getDetailbook());
            ps.setString(8, book.getBookID());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }

    public void insertProduct(Books book) {
        try {
            ps = conn.prepareStatement("INSERT INTO Books (bookID, bookName, authorName, publisherName, publisherDate, price, quantity, detailbook) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, book.getBookID());
            ps.setString(2, book.getBookName());
            ps.setString(3, book.getAuthorName());
            ps.setString(4, book.getPublisherName());
            ps.setDate(5, book.getPublisherDate());
            ps.setDouble(6, book.getPrice());
            ps.setInt(7, book.getQuantity());
            ps.setString(8, book.getDetailbook());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }

    public void deleteProduct(String bookID) {
        try {
            ps = conn.prepareStatement("DELETE FROM Books WHERE bookID=?");
            ps.setString(1, bookID);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    } */
}


