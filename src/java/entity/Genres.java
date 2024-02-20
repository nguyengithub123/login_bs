/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.List;


public class Genres {

    private String genreID;
    private String genreName;
    private List<Books> genreBooks;

    public Genres() {
    }

    public Genres(String genreID) {
        this.genreID = genreID;
    }
    
    public Genres(String genreID, String genreName) {
        this.genreID = genreID;
        this.genreName = genreName;
    }
    

    public String getGenreID() {
        return genreID;
    }

    public void setGenreID(String genreID) {
        this.genreID = genreID;
    }

    public String getGenreName() {
        return genreName;
    }

    public void setGenreName(String genreName) {
        this.genreName = genreName;
    }

    public List<Books> getGenreBooks() {
        return genreBooks;
    }

    public void setGenreBooks(List<Books> genreBooks) {
        this.genreBooks = genreBooks;
    }
    
    
}
