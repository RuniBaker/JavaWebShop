import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet(urlPatterns = {"/CreateProductServlet"})
public class CreateProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("productName");
        String productPriceS = req.getParameter("productPrice");
        System.out.println(productPriceS);

        int productPrice = Integer.parseInt(productPriceS);


        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection1 = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/java_store","root","toor");
            PreparedStatement statement1 = connection1.prepareStatement
                    ("INSERT INTO products (product_name, product_price) VALUES ('" + productName + "','" + productPrice + "')");

            int i = statement1.executeUpdate();

                resp.sendRedirect("index.jsp");



        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }
}
