<html>
<head>
<style>
#tittle{
position:absolute;
top: 120px;
left: 800px;
}

#productId{
position: absolute;
top: 180px;
left: 650px;

height: 50px;
width:460px;

font-size:25px;
}

#productName{
position: absolute;
top: 240px;
left: 650px;

height: 50px;
width:460px;

font-size:25px;
}

#productPrice{
position: absolute;
top: 300px;
left: 650px;

height: 50px;
width:460px;

font-size:25px;
}


#alterProduct{
position:absolute;
top: 360px;
left: 810px;

height: 50px;
width:150px;
}
</style>

<title> Alter Product Info</title>
</head>
<body>
<h2 id="tittle">Alter Product</h2>

<form method="post" action="AlterProductServlet">
<input type="number" id="productId" name="productId" placeholder="Product ID">
<input type="text" id="productName" name="productName" placeholder="Product Name">
<input type="int" id="productPrice" name="productPrice" placeholder="Product Price">
<button id="alterProduct">Alter product</button>
</from>

</body>
</html>