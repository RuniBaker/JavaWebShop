<html>
 <head>
 <style>
 #tittle{
 position:absolute;
 top: 120px;
 left: 800px;
 }

 #buyerId{
 position: absolute;
 top: 180px;
 left: 650px;

 height: 50px;
 width:460px;

 font-size:25px;
 }

 #buyerName{
 position: absolute;
 top: 240px;
 left: 650px;

 height: 50px;
 width:460px;

 font-size:25px;
 }

 #buyerLastName{
 position: absolute;
 top: 300px;
 left: 650px;

 height: 50px;
 width:460px;

 font-size:25px;
 }

 #buyerCity{
  position: absolute;
  top: 360px;
  left: 650px;

  height: 50px;
  width:460px;

  font-size:25px;
  }

  #buyerAddress{
   position: absolute;
   top: 420px;
   left: 650px;

   height: 50px;
   width:460px;

   font-size:25px;
   }
#purchases{
position: absolute;
   top: 480px;
   left: 650px;

   height: 50px;
   width:460px;

   font-size:25px;
}

 #alterBuyer{
 position:absolute;
 top: 540px;
 left: 810px;

 height: 50px;
 width:150px;
 }
 </style>
 <title> Alter Buyer Info</title>
 </head>
 <body>
 <h2 id="tittle">Alter Buyer</h2>

 <form method="post" action="AlterBuyerServlet">
 <input type="number" id="buyerId" name="buyerId" placeholder="Buyer ID">
 <input type="text" id="buyerName" name="buyerName" placeholder="Buyer Name">
 <input type="text" id="buyerLastName" name="buyerLastName" placeholder="Buyer Last Name">
 <input type="text" id="buyerCity" name="buyerCity" placeholder="Buyer City">
 <input type="text" id="buyerAddress" name="buyerAddress" placeholder="Buyer Address">
 <input type="number" id="purchases" name="purchases" placeholder="Number of Purchases">
 <button id="alterBuyer">Alter Buyer</button>
 </from>

 </body>
 </html>