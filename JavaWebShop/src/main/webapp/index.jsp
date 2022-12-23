<%@page contentType="text/html" import="java.sql.*" %>
<html>
<head>

<title> Home Page </title>

<style>

.button{
    position: relative;
    left: 4px;
    top: 5px;

    margin-bottom: 0.275rem;

    display: flex;
    flex-direction: row;
    justify-content: center;
}


#buyers_link{
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
        top: 30px;
        left: 960px;

        text-align: center;
        margin: 0;
        display:list-inline-flex;
        flex-direction: row;
        justify-content: center;

}
.tr{

}
.form{
    height:21px;
    width:37.5 px;
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
                    resultSet = statement.executeQuery("select * from products LIMIT 35");

  %>

 <table border = "1" width = "50%" height:200px>
          <tr>
             <th>product name</th>
             <th>product id</th>
             <th>product price</th>
          </tr>


          <%while(resultSet.next()){%>
                     <%

                       out.println("<tr" + " style=" + '"' + "height: 23.3px" + '"' + ">");
                       out.println("<td>" + resultSet.getString("product_name") + "</td>");
                       out.println("<td>" + resultSet.getInt("product_id") + "</td>");
                       out.println("<td>" + resultSet.getDouble("product_price")+ "</td>");
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
            resultSet1 = statement1.executeQuery("select * from products LIMIT 35");

            while(resultSet1.next()){ %>
                <%
                 out.println("<form method=" + '"' + "post" + '"' + " action=" + '"' + "buyProductServlet" + '"' + " style=" + '"' + "height:9.4px" + '"' + ">");
                 out.println("<button class=" + '"' +"button" + '"' +  "id=" + '"' + resultSet1.getInt("product_id") + '"' +  "value=" + '"' + resultSet1.getString("product_name") + '"' + "name=" + '"' + "button" + '"' + ">buy</button>");
                 out.println("</form>");
                 %>
            <%

             connection.close();
                                       }} catch (Exception e) {
                                        e.printStackTrace();
                                        }

            %>

            </div>



        <a href="buyers.jsp" id="buyers_link">Buyers</a>
        <a href="sales.jsp" id="sales_link">Sales</a>

 <div class="functions">
        <div class="createBut">
        <form>
        <a href="createProduct.jsp">Create a new product</a>
        </form>
        </div>

        <div class="createBut">
                <form>
                <a href="deleteProduct.jsp">Delete product</a>
                </form>
                </div>

                <div class="createBut">
                        <form>
                        <a href="alterProduct.jsp">Alter product info</a>
                        </form>
                        </div>

                        </div>

</body>
</html>