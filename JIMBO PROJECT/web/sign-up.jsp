<!DOCTYPE html>
<html lang="en">

<head>
  <title>Create Account | Jimbo</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap.min.css">

<body>

    <section class="accout_creation">
      <div class="account_details_container">
                    <h3 style="color:red; margin: auto auto; width:50%; align-items: center">${passwd3rror}</h3>
                        <h3 style="color:red; margin: auto auto; width:50%; align-items: center">${userExists}</h3>
        <form id="my_form" class="form-spacing" method="post" action="sign-up">
          <h4>Create New Account</h4>
          <hr>
          <div class="form-group">
            Your Name * 
            <input type="text" name="firstName" placeholder="First Name" required>
          </div>
           <div class="form-group">
            Your Name * 
            <input type="text" name="lastName" placeholder="Last Name" required>
          </div>
          <div class="form-group">
             Your Email *
            <input type="email" name="email" placeholder="Email" required>
          </div>
          <div class="form-group">
             Address * 
            <input type="text" name="address" placeholder="Enter address" required>
          </div>
           <div class="form-group">
             Age* 
            <input type="number" name="age" placeholder="select age" required>
          </div>
           <div class="form-group">
            Gender * 
            <select name="gender" class="form-group-select">
                
                <option>----Select Gender----</option>
                <option value ="Male" name="gender">Male</option>
                <option value="Female" name="gender">Female</option>

            </select>
          </div>
          <div class="form-group">
             Password * 
            <input type="password" name="password" placeholder="create password" required>
          </div>

          <div class="form-group">
             Confirm Password * 
            <input type="password" name="confirm-password" placeholder="Re-enter password" required>
          </div>
          <button type="submit" style="background-color:#5cb874">SIGN UP</button>
        </form>
      </div>

     <div class="redirect_to_sign_in">
   
        <a href="user_login.jsp" > I already have an existing account</a>
      </div>



    </section>

 


</body>

</html>