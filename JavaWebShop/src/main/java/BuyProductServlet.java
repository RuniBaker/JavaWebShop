import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


@WebServlet(urlPatterns = {"/buyProductServlet"})
public class BuyProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String productName = req.getParameter("button");



        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection1 = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/java_store","root","toor");
            Statement statement=connection1.createStatement();
            ResultSet resultSet = statement.executeQuery("Select * from current_buyer");
            while (resultSet.next()) {
                PreparedStatement statement1 = connection1.prepareStatement
                        ("INSERT INTO sales (buyer_id, buyer_name, product_name, date_purchase) VALUES ('"+ resultSet.getInt("idcurrent_buyer") +"','" + resultSet.getString("cur_buyer_name") +"','" + productName + "', '"+ now +"')");


                int id =  resultSet.getInt("idcurrent_buyer");
                String name = resultSet.getString("cur_buyer_name");
                String lastname = resultSet.getString("cur_buyer_lastnaame");
                String city = resultSet.getString("cur_buyer_city");
                String adress = resultSet.getString("cur_buyer_adress");
                int i = statement1.executeUpdate();

                Statement statement2=connection1.createStatement();
                ResultSet resultSet1 = statement.executeQuery("Select * from buyers WHERE buyer_id =" + id );
                while (resultSet1.next()){
                    int purchases = resultSet1.getInt("num_of_purchases");
                    int incPurchases = purchases+1;
                    PreparedStatement statement3 = connection1.prepareStatement
                            ("CALL alter_buyer('" + id + "','" + name + "', '" + lastname + "','" + city + "', '" + adress  +"', '"+ incPurchases+"' )");
                    int s = statement3.executeUpdate();

                }
                PreparedStatement statement4 = connection1.prepareStatement
                        ("DELETE FROM products WHERE product_name = " + '"' + productName + '"');
                int f = statement4.executeUpdate();
                resp.sendRedirect("index.jsp");
            }



        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }
}
