package Controller;

import model.CustomerDAO;
import model.RegisterDAO;
import entity.Customers;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Thịnh Nguyễn
 */
public class CustomerManagerServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerManagerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerManagerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        CustomerDAO customer = new CustomerDAO();
        List<Customers> customersList = customer.getCustomers(); // Example method to get all customers

        // Set the customers list as an attribute of the request
        request.setAttribute("customersList", customersList);

        // Forward the request to your JSP page (or other view technology)
        request.getRequestDispatcher("customer_manage.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        RegisterDAO registerDAO = new RegisterDAO();

        // Kiểm tra xem username hoặc email đã tồn tại trong cơ sở dữ liệu hay chưa
        if (registerDAO.checkEmailExists(email) || registerDAO.checkUsernameExists(username)) {
            // Nếu đã tồn tại, đưa ra thông báo lỗi và ở lại trang đăng ký
            request.setAttribute("error", "Username or email has existed!");
            request.getRequestDispatcher("customer_manage.jsp").forward(request, response);
        } else {
            // Nếu không có trùng lặp, thêm người dùng mới vào cơ sở dữ liệu
            registerDAO.addUser(username, fullname, email, password);
            // Đưa ra thông báo thành công và chuyển hướng về trang index.html
            request.setAttribute("error", "Sign up succesfully!");
            response.setHeader("Refresh", "3; url=customer_manage.jsp");
        }
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
