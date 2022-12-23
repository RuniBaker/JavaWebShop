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


@WebServlet(urlPatterns = {"/AlterProductServlet"})
public class AlterProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idS = req.getParameter("productId");
        int id = Integer.parseInt(idS);
        String productName = req.getParameter("productName");
        String productPriceS = req.getParameter("productPrice");
        int productPrice = Integer.parseInt(productPriceS);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection1 = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/java_store", "root", "toor");
            PreparedStatement statement1 = connection1.prepareStatement
                    ("CALL alter_products('" + id + "','" + productName + "', '" + productPrice + "')");

            int i = statement1.executeUpdate();

            if (i >= 1) {
                resp.sendRedirect("index.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
