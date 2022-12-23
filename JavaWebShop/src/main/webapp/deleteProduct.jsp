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


#deleteProduct{
position:absolute;
top: 240px;
left: 810px;

height: 50px;
width:150px;
}
</style>
<title>Delete Product</title>
</head>
<body>
<h2 id="tittle">Delete Product</h2>

<form method="post" action="DeleteProductServlet">
<input type="number" id="productId" name="productId" placeholder="Product ID">
<button id="deleteProduct">Delete product</button>
</from>

</body>
</html>