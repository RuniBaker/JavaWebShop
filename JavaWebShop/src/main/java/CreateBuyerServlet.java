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

@WebServlet(urlPatterns = {"/CreateBuyerServlet"})
public class CreateBuyerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String BuyerName = req.getParameter("buyerName");
        String buyerLastName = req.getParameter("buyerLastName");
        String buyerCity = req.getParameter("buyerCity");
        String buyerAddress = req.getParameter("buyerAddress");





        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection1 = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/java_store","root","toor");
            PreparedStatement statement1 = connection1.prepareStatement
                    ("INSERT INTO buyers (buyer_name, buyer_lastname, city, adress) VALUES ('" + BuyerName + "','" + buyerLastName + "','" + buyerCity + "','" + buyerAddress + "')");

            int i = statement1.executeUpdate();


            if (i >= 1) {
                resp.sendRedirect("buyers.jsp");
            }


        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }
}
