<!DOCTYPE html>
<html lang="en">

<head>
  <title>Create Account | Jimbo</title>
  <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap.min.css">

<body>

    <section class="accout_creation">
      <div class="account_details_container">
        <form id="my_form" class="form-spacing" method="get" action="../UserRegister">
          <h4>Create New Account</h4>
          <hr>
          <div class="form-group">
            <label for="fname">Your Name *</label>
            <input type="text" name="fname" placeholder="Name" required>
          </div>

          <div class="form-group">
            <label for="username">Username *</label>
            <input type="text" name="username" placeholder="Username" required>
          </div>
          <div class="form-group">
            <label for="email">Your Email *</label>
            <input type="email" name="email" placeholder="Email" required>
          </div>
          <div class="form-group">
            <label for="password">Password *</label>
            <input type="password" name="password" placeholder="Enter password" required>
          </div>

          <div class="form-group">
            <label for="confirm_password">Confirm Password *</label>
            <input type="password" name="confirm_password" placeholder="Re-enter password" required>
          </div>

          <button type="submit">Sign up</button>
        </form>
      </div>

      <div class="redirect_to_sign_in">
        <p>Have an existing account already? Continue to sign in</p>
        <a href="user_login.jsp"><button>Sign in</button></a>
      </div>


    </section>

  </main><!-- End #main -->


</body>

</html>