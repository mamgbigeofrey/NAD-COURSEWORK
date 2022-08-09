<%-- 
    Document   : about
    Created on : Aug 9, 2022, 4:48:11 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Page | Jimbo </title>
        <style>
            .container{
                width: 90vw;
                margin: auto;
                color: gray;
                font-size: 18px;
                display: grid;
                grid-template-columns: 1fr 1fr;
            }
            .container .images{
                display: flex;
                flex-direction: column;
            }
            .container .images div{
                display: flex;
                flex-direction: row;
            }
            .container .images div p{
                margin-top: 100px;
                margin-left: 50px;
            }
            .container .images img{
                width: 40%;
                border-radius: 50%;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
        <div class="images">
            <div>
                <img src="images/th.jpg">
                <p>We deal in jackets</p>
            </div>
            <div>
                <img src="images/th1.jpg">
                <p>We deal in Shirts</p>
            </div>
            <div>
                <img src="images/th3.jpg">
                <p>We deal in Shoes</p>
            </div>
            <div>
                <img src="images/th4.jpg">
                <p>We deal in Jewelleries</p>
            </div>
            
            
            
            

        </div>
       
        <div class="about">
             <h1>We are Jimbo</h1>
            <p>We’re a Ugandan company that brings your needs at your vicinity and the fastest-growing multi-category player in Uganda,
                and Africa. With technology at the core of our business, we create innovative
                solutions by connecting customers, businesses and couriers, whilst making sure we have a 
                sustainable impact on our communities and ecosystems: we’re a tech-first, responsible company. </p>
            <p>Jimbo was founded under Lt Engineer Jimbo the then CEO of google 2002 to offer the best solutions to our communities 
            while making sure they aren't stranded and is forever under his legacy.</p>
        <p>Jimbo deals in four product lines thats clothes in the category of shirts, shoes, jackets and jewellery. We are grateful to 
        our customers for their continious support towards the business and you are the reason why we operate</p>
        <p>To do business with us, you can either use this online shop or you can even come to our offices and stores at <b>Kampala Road E-Towers building shop number CD432
            and get yourself some goodies today.</b> </p>
            <p>You can contact us on this using the company email (<a href="#">info.jimbo@workmail.com</a> 
                or better still send us a whatsapp message using <a href="#">0778967012</a></p>
            <h4>Thanks for standing with us. Please visit us again!!</h4>
        
        </div>
        </div>
    </body>
</html>
