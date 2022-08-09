<%-- 
    Document   : admin_login
    Created on : Aug 3, 2022, 6:30:53 PM
    Author     : Hp
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Admin Login | Jimbo</title>
   <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap.min.css">

<body>

  <main id="main">


    <section class="account_login">
      <div class="account_login_container">
          <form class="form-spacing" method="post" action="Admin_authentication">
          <h4>Admin Log In</h4>
          <hr>
          <div class="form-group">
            Admin username*
            <input type="text" name="username" placeholder="Enter username" required>
          </div>

          <div class="form-group">
          Admin Password*
            <input type="password" name="password" placeholder="Enter password" required>
          </div>

          <button type="submit">Sign In</button>
        </form>
      </div>

    </section>

  </main><!-- End #main -->

</body>

</html>