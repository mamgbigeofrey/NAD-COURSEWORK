<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>User Login | Jimbo</title>
   <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap.min.css">

<body>

  <main id="main">


    <section class="account_login">
      <div class="account_login_container">
        <form class="form-spacing" method="POST" action="../User_authentication">
          <h4>User Log In</h4>
          <hr>
          <div class="form-group">
            <label for="username">User Email*</label>
            <input type="email" name="username" placeholder="Enter email to log in" required>
          </div>

          <div class="form-group">
            <label for="password">Password*</label>
            <input type="password" name="password" placeholder="Enter password" required>
          </div>

          <button type="submit">Sign In</button>
        </form>
      </div>

      <div class="redirect_to_sign_up">
        <p>Have no existing account yet? Get the best from Jimbo by signing up</p>
        <a href="newAccount.jsp"><button>Sign up</button></a>
      </div>


    </section>

  </main><!-- End #main -->

</body>

</html>