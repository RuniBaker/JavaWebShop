import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet(urlPatterns = {"/SelectBuyerServlet"})
public class SelectBuyerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String buyerIDS = req.getParameter("button");
        int buyer_id = Integer.parseInt(buyerIDS);

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection1 = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/java_store","root","toor");
           PreparedStatement statement2 = connection1.prepareStatement("TRUNCATE TABLE current_buyer;");
           statement2.executeUpdate();
           Statement statement1=connection1.createStatement();
           ResultSet resultSet = statement1.executeQuery("Select * from buyers WHERE buyer_id =" + buyer_id);
           while (resultSet.next()){
               PreparedStatement statement3 = connection1.prepareStatement
                       ("insert into current_buyer(idcurrent_buyer,cur_buyer_name, cur_buyer_lastnaame, cur_buyer_city, cur_buyer_adress, cur_buyer_num_purchases) VALUES ('" + resultSet.getInt("buyer_id") + "','" + resultSet.getString("buyer_name") + "','" + resultSet.getString("buyer_lastname") + "','" + resultSet.getString("city") + "','" + resultSet.getString("adress") +"','" + resultSet.getInt("num_of_purchases") + "')");
               int s = statement3.executeUpdate();
           }

            resp.sendRedirect("buyers.jsp");



        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

    }
}
