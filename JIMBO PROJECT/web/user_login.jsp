<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>User Login | Jimbo</title>
   <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap.min.css">

<body>

  <main id="main">

   
    <section class="account_login">
       
      <div class="account_login_container">
       
  
        <form class="form-spacing" method="POST" action="login-user">
           <h4>User Log In</h4>
          <hr>
          <div class="form-group">
            User Email* 
            <input type="email" name="login-email" placeholder="johndoe@gmail.com" required>
          </div>

          <div class="form-group">
             Password*
            <input type="password" name="login-password" placeholder="Enter your password" required>
          </div>
          
          <div > <h3 style="color: red;">${error}</h3> </div>

          <button type="submit">Sign In</button>
          <h2 style="color:green;">${signUpSucess}</h2>
            
        </form>
      </div>
               


      <div class="redirect_to_sign_up">
        <p>Have no existing account yet? Get the best from Jimbo by signing up</p>
        <a href="sign-up.jsp"><button>Sign up</button></a>
      </div>


    </section>

  </main> 

</body>

</html>