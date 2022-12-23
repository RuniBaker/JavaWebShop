<%@page contentType="text/html" import="java.sql.*" %>
<html>
<head>
<style>
#tittle{
position:absolute;
top: 120px;
left: 800px;
}
#buyerName{
position:absolute;
top: 180px;
left: 650px;

height: 50px;
width:460px;

font-size:25px;
}

#buyerLastName{
position:absolute;
top: 240px;
left: 650px;

height: 50px;
width:460px;

font-size:25px;
}

#buyerCity{
position:absolute;
top: 300px;
left: 650px;

height: 50px;
width:460px;

font-size:25px;
}

#buyerAddress{
position:absolute;
top: 360px;
left: 650px;

height: 50px;
width:460px;

font-size:25px;
}

#createBuyer{
position:absolute;
top: 420px;
left: 810px;

height: 50px;
width:150px;
}

</style>
<title> Create Buyer</title>
</head>
<body>
<h2 id="tittle">Create Buyer</h2>

<form method="post" action="CreateBuyerServlet">
<input type="text" id="buyerName" name="buyerName" placeholder="Buyer Name">
<input type="text" id="buyerLastName" name="buyerLastName" placeholder="Buyer Last Name">
<input type="text" id="buyerCity" name="buyerCity" placeholder="Buyer City">
<input type="text" id="buyerAddress" name="buyerAddress" placeholder="Buyer Address">
<button id="createBuyer">Create Buyer</button>
</from>

</body>
</html>