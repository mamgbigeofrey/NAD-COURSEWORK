<!DOCTYPE html>
<html lang="en">

<head>
  <title>Create Account | Jimbo</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap.min.css">

<body>

    <section class="accout_creation">
      <div class="account_details_container">
        <form id="my_form" class="form-spacing" method="post" action="sign-up">
          <h4>Create New Account</h4>
          <hr>
          <div class="form-group">
            Your Name * 
            <input type="text" name="username" placeholder="Name" required>
          </div>
          <div class="form-group">
             Your Email *
            <input type="email" name="email" placeholder="Email" required>
          </div>
          <div class="form-group">
             Password * 
            <input type="password" name="password" placeholder="create password" required>
          </div>

          <div class="form-group">
             Confirm Password * 
            <input type="password" name="confirm-password" placeholder="Re-enter password" required>
          </div>

          <button type="submit">SIGN UP</button>
        </form>
      </div>

      <div class="redirect_to_sign_in">
   
        <a href="user_login.jsp"> <p>I already have an existing account</p></a>
      </div>


    </section>

 


</body>

</html>