<html>
<head>
<style>
#tittle{
position:absolute;
top: 120px;
left: 800px;
}

#BuyerID{
position: absolute;
top: 180px;
left: 650px;

height: 50px;
width:460px;

font-size:25px;
}


#deleteBuyer{
position:absolute;
top: 240px;
left: 810px;

height: 50px;
width:150px;
}
</style>
<title> Delete Buyer</title>
</head>
<body>
<h2 id="tittle">Delete Buyer</h2>

<form method="post" action="DeleteBuyerServlet">
<input type="number" id="buyerID" name="buyerID" placeholder="Buyer ID">
<button id="deleteBuyer">Delete Buyer</button>
</from>

</body>
</html>