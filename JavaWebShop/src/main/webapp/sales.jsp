<%@page contentType="text/html" import="java.sql.*" %>
<html>
<head>
<title> Sales </title>
<style>
#buyers_link{
    position:absolute;
    top:11px;
    left:1760px;
}

#sales_link{
    position:absolute;
    top:11px;
    left:1840px;
}

#table{
    position: absolute;
    top: 40px;
    left: 0px;
}
</style>
</head>

<body>

     <a href="index.jsp" id="buyers_link">Products</a>Buyers
     <a href="buyers.jsp" id="sales_link">Buyers</a>


<%
              String driver = "com.mysql.jdbc.Driver";
              String connectionUrl = "jdbc:mysql://localhost:3306/";
              String database = "java_store";
              String userid = "root";
              String password = "toor";

              try {
                                           Class.forName(driver);
                                          } catch (ClassNotFoundException e) {
                                          e.printStackTrace();
                                          }

              Connection connection = null;
              Statement statement = null;
              ResultSet resultSet = null;

        try{
                    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                    statement=connection.createStatement();
                    resultSet = statement.executeQuery("select * from sales ORDER BY date_purchase LIMIT 25");
  %>
  <table border = "1" width = "100%" id="table">
              <tr>
                 <th>Sale ID</th>
                 <th>Buyer ID</th>
                 <th>Buyer Name</th>
                 <th>Product Name</th>
                 <th>Date of purchase</th>
              </tr>
              <%while(resultSet.next()){%>
                         <%
                           out.println("<tr" + " style=" + '"' + "height: 23.3px" + '"' + ">");
                           out.println("<td>" + resultSet.getInt("sale_id") + "</td>");
                           out.println("<td>" + resultSet.getString("buyer_id") + "</td>");
                           out.println("<td>" + resultSet.getString("buyer_name")+ "</td>");
                           out.println("<td>" + resultSet.getString("product_name")+ "</td>");
                           out.println("<td>" + resultSet.getDate("date_purchase")+ "</td>");
                           out.println("</tr>");
                           }
                         %>
                         </table>
                                      <%


                                                    connection.close();
                                                                             } catch (Exception e){
                                                                              e.printStackTrace();
                                                                              }%>
</body>
</html>