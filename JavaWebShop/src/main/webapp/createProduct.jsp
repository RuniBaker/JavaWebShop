<%@page contentType="text/html" import="java.sql.*" %>
<html>
<head>
<style>
#tittle{
position:absolute;
top: 120px;
left: 800px;
}
#productName{
position:absolute;
top: 180px;
left: 650px;

height: 50px;
width:460px;

font-size:25px;
}

#productPrice{
position:absolute;
top: 240px;
left: 650px;

height: 50px;
width:460px;

font-size:25px;
}

#createProduct{
position:absolute;
top: 300px;
left: 810px;

height: 50px;
width:150px;
}

</style>
<title> Create Product</title>
</head>
<body>
<h2 id="tittle">Create product</h2>

<form method="post" action="CreateProductServlet">
<input type="text" id="productName" name="productName" placeholder="Product name">
<input type="text" id="productPrice" name="productPrice" placeholder="Product price">
<button id="createProduct">Create product</button>
</from>

</body>
</html>