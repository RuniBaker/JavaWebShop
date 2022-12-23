<%@page contentType="text/html" import="java.sql.*" %>
<html>
<head>
<title> Buyers </title>
<style>
#products_link{
    position:absolute;
        top:11px;
        left:1680px;
}

#sales_link{
    position:absolute;
        top:11px;
        left:1770px;
}

.createBut{
    border-style: solid;
        border-width: 5px;
        border-color: red;

        width: 200px;
        height: 200px;



        position:relative;


         margin-bottom: 100px;

}

.createBut a {

      border-color: black;

            margin: 0;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
}

.functions{

    position: absolute;
        top: 50px;
        left: 1640px;


        height: 850px;
        width: 250px;



}

.button-row{

        height: 800px;
        width: 70px;


        position: absolute;
        top: 36px;
        left: 960px;

        text-align: center;
        margin: 0;
        display:list-inline-flex;
        flex-direction: row;
        justify-content: center;

}
</style>
</head>
<body>
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
                    resultSet = statement.executeQuery("select * from buyers LIMIT 20");

  %>
   <table border = "1" width = "50%">
            <tr>
               <th>Buyer ID</th>
               <th>Buyer Name</th>
               <th>Buyer Last Name</th>
               <th>City</th>
               <th>Address</th>
               <th>Number of purchases</th>
            </tr>


            <%while(resultSet.next()){%>
                       <%out.println("<tr" + " style=" + '"' + "height: 23.3px" + '"' + ">");
                         out.println("<td>" + resultSet.getInt("buyer_id") + "</td>");
                         out.println("<td>" + resultSet.getString("buyer_name") + "</td>");
                         out.println("<td>" + resultSet.getString("buyer_lastname")+ "</td>");
                         out.println("<td>" + resultSet.getString("city")+ "</td>");
                         out.println("<td>" + resultSet.getString("adress")+ "</td>");
                         out.println("<td>" + resultSet.getInt("num_of_purchases")+ "</td>");
                         out.println("</tr>");

                          }
                       %>
                       </table>
                       <div class="button-row">
                                   <%
                                                 Connection connection1 = null;
                                                 Statement statement1 = null;
                                                 ResultSet resultSet1 = null;

                                   connection1 = DriverManager.getConnection(connectionUrl+database, userid, password);
                                   statement1=connection1.createStatement();
                                   resultSet1 = statement1.executeQuery("select * from buyers LIMIT 20");

                                   while(resultSet1.next()){ %>
                                       <%
                                        out.println("<form method=" + '"' + "post" + '"' + " action=" + '"' + "SelectBuyerServlet" + '"' + " style=" + '"' + "height:9.4px" + '"' + ">");
                                        out.println("<button class=" + '"' +"button" + '"' +  "id=" + '"' + resultSet1.getInt("buyer_id") + '"' + "name=" + '"' + "button" + '"' + "value=" + '"' + resultSet1.getInt("buyer_id") + '"'  +  ">use </button>");

                                        out.println("</form>");
                                        %>

                  <%
                                }

                              connection.close();
                              } catch (Exception e) {
                              e.printStackTrace();
                              }
                              %>
                            </div>


                              <a href="index.jsp" id="products_link">Products</a>
                              <a href="sales.jsp" id="sales_link">Sales</a>

                                    <div class="functions">
                                      <div class="createBut">
                                      <form>
                                      <a href="createBuyer.jsp">Add new Buyer</a>
                                      </form>
                                      </div>

                                      <div class="createBut">
                                              <form>
                                              <a href="deleteBuyer.jsp">Delete Buyer</a>
                                              </form>
                                              </div>

                                              <div class="createBut">
                                                      <form>
                                                      <a href="alterBuyer.jsp">Alter buyer info</a>
                                                      </form>
                                                      </div>
                                            </div>
</body>
</html>
