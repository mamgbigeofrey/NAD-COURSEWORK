<!DOCTYPE html>
<html lang="en">

<head>
  <title>Login | Jimbo Textiles</title>
  <link rel="stylesheet" type="text/css" href="style.css">

<body>

  <main id="main">


    <section class="account_login">
      <div class="account_login_container">
        <form class="form-spacing" method="post" action="#">
          <h4>Log In</h4>
          <hr>
          <div class="form-group">
            <label for="username">Username</label>
            <input type="email" name="username" placeholder="Enter email to log in" required>
          </div>

          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" placeholder="Enter password" required>
          </div>

          <button type="submit">Sign In</button>
        </form>
      </div>

      <div class="redirect_to_sign_up">
        <p>Have no existing account yet? Get the best from Jimbo Textiles by signing up</p>
        <a href="newAccount.jsp"><button>Sign up</button></a>
      </div>


    </section>

  </main><!-- End #main -->

</body>

</html>