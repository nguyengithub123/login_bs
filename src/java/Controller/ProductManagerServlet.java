/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import model.productDAO;
import entity.Books;
import entity.Genres;
import entity.Customers;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class ProductManagerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        try {

            HttpSession session = request.getSession();
            entity.Customers user = (Customers) session.getAttribute("user");

            //if (user.getUserRole().equalsIgnoreCase("admin")) {
                if (action == null || action == "") {
                    productDAO c = new productDAO();
                    List<Books> book = c.getProduct();
                    List<Genres> gen = c.getGenres();
                    request.setAttribute("bookData", book);
                    request.setAttribute("genreData", gen);
                    request.getRequestDispatcher("product_manage.jsp").forward(request, response);
                } /*else if (action.equalsIgnoreCase("updateProduct")) {
                updateProduct(request, response);
            } else if (action.equalsIgnoreCase("insertProduct")) {
                insertProduct(request, response);
            } else if (action.equalsIgnoreCase("deleteProduct")) {
                deleteProduct(request, response);
            }*/
            //}
        }catch (Exception e) {
            response.sendRedirect("404.jsp");
        }
    }
    /*
    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String bookID = request.getParameter("bookID");
    String bookName = request.getParameter("bookName");
    String authorName = request.getParameter("authorName");
    String publisherName = request.getParameter("publisherName");
    String publisherDateStr = request.getParameter("publisherDate");
    Date publisherDate = Date.valueOf(publisherDateStr);
    double price = Double.parseDouble(request.getParameter("price"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    String detailbook = request.getParameter("detailbook");
    // Similarly, get other parameters...

    // Create a new Books object with the updated values
    Books book = new Books();
    book.setBookID(bookID);
    book.setBookName(bookName);
    book.setAuthorName(authorName);
    book.setPublisherName(publisherName);
    book.setPublisherDate(publisherDate);
    book.setPrice(price);
    book.setQuantity(quantity);
    book.setDetailbook(detailbook);
    // Similarly, set other attributes...

    // Use the productDAO to update the product in the database
    productDAO dao = new productDAO();
    dao.updateProduct(book);

    // Redirect to the product manager page after updating
    response.sendRedirect("productManager");
}

private void insertProduct(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Retrieve all parameters from the request
    String bookID = request.getParameter("bookID");
    String bookName = request.getParameter("bookName");
    String authorName = request.getParameter("authorName");
    String publisherName = request.getParameter("publisherName");
    String publisherDateStr = request.getParameter("publisherDate");
    Date publisherDate = Date.valueOf(publisherDateStr);
    double price = Double.parseDouble(request.getParameter("price"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    String detailbook = request.getParameter("detailbook");
    // Similarly, get other parameters...

    // Create a new Books object with the retrieved values
    Books book = new Books();
    book.setBookID(bookID);
    book.setBookName(bookName);
    book.setAuthorName(authorName);
    book.setPublisherName(publisherName);
    book.setPublisherDate(publisherDate);
    book.setPrice(price);
    book.setQuantity(quantity);
    book.setDetailbook(detailbook);
    // Similarly, set other attributes...

    // Use the productDAO to insert the product into the database
    productDAO dao = new productDAO();
    dao.insertProduct(book);

    // Redirect to the product manager page after insertion
    response.sendRedirect("productManager");
}

private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Retrieve the bookID of the product to be deleted from the request
    String bookID = request.getParameter("bookID");

    // Use the productDAO to delete the product from the database
    productDAO dao = new productDAO();
    dao.deleteProduct(bookID);

    // Redirect to the product manager page after deletion
    response.sendRedirect("productManager");
}
    */
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}