import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(urlPatterns = {"/AlterBuyerServlet"})
public class AlterBuyerServlet  extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idS = req.getParameter("buyerId");
        int id = Integer.parseInt(idS);
        String buyerName = req.getParameter("buyerName");
        String buyerLastName = req.getParameter("buyerLastName");
        String city = req.getParameter("buyerCity");
        String adress = req.getParameter("buyerAddress");
        String purchases = req.getParameter("purchases");
        System.out.println("Hello");




        try {


            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection1 = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/java_store", "root", "toor");
            PreparedStatement statement1 = connection1.prepareStatement
                    ("CALL alter_buyer('" + id + "','" + buyerName + "', '" + buyerLastName + "','" + city + "', '" + adress +"', '"+ purchases +"')");

            int i = statement1.executeUpdate();

            if (i >= 1) {
                resp.sendRedirect("buyers.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
