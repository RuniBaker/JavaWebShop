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

@WebServlet(urlPatterns = {"/DeleteBuyerServlet"})
public class DeleteBuyerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idInt = req.getParameter("buyerID");
        int id = Integer.parseInt(idInt);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection1 = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/java_store", "root", "toor");
            PreparedStatement statement1 = connection1.prepareStatement
                    ("DELETE FROM buyers WHERE buyer_id = '" + id + "'");
            int i = statement1.executeUpdate();

            if (i >= 1) {
                resp.sendRedirect("buyers.jsp");
            } else{
                System.out.printf("fail");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
