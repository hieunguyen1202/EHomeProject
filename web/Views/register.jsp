<%-- 
    Document   : login
    Created on : Sep 28, 2023, 11:39:22 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Register</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
            crossorigin="anonymous">
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
        crossorigin="anonymous"></script>

        <style>
            .red{
                color: red;
            }
        </style>
    </head>
    <body style="background-color: #F8F9FD">
        <div class="container-fluid">
            <div class="container" style="background-color: white;padding: 8%">
                <div class="text-center" style="margin-top: -8%;margin-bottom: 3%">
                    <h1>Create your Account</h1>
                </div>
                <form action="register" method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <h3 class="text-secondary">Account</h3>
                            <div class="mb-3">
                                <label for="username" class="form-label">Username<span class="red">*</span></label>
                                <input type="text" class="form-control" id="username" name="username" required="required" pattern="^[a-zA-Z0-9]{5,20}$">
                                       <span style="font-size: 10px;font-style: italic" class="error" id="usernameError">Please enter a valid username (5-20 characters, letters, numbers).</span>
                            </div>
                            <div class="mb-3">
                                <label for="matKhau" class="form-label">Password<span
                                        class="red">*</span></label> <input type="password" class="form-control" pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$"
                                                                    id="password" name="password" required="required" onkeyup="kiemTraMatKhau()">
                                <span style="font-size: 10px;font-style: italic" class="error" id="passwordError">Please enter a valid password (at least 8 characters, containing at least one uppercase letter, one lowercase letter, and one digit).</span>
                            </div>
                            <div class="mb-3">
                                <label for="comfirmpassword" class="form-label" >Comfirm Password<span class="red">*</span> <span id="msg" class="red" ></span>
                                </label> <input type="password" class="form-control" id="comfirmpassword"
                                                name="comfirmpassword" required="required" onkeyup="kiemTraMatKhau()">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label> <input
                                    type="email" class="form-control" id="email" name="email">
                            </div>

                            <div class="form-group d-md-flex">
                                <div class="w-50 text-left">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" name="isRenter" value="true" checked>
                                        <label class="form-check-label text-secondary" for="isRenter">I am a Renter</label>
                                    </div>
                                </div>
                                <div class="w-50 text-right">
                                    <div>
                                        <p class="text-center text-secondary">Already a member? <a data-toggle="tab" href="login">Login</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h3 class="text-secondary">Information User</h3>
                            <div class="mb-3">
                                <label for="fullname" class="form-label">Full Name</label> <input
                                    type="text" pattern="^[A-Za-z-' ]+$" class="form-control" id="fullname" name="fullname">
                            </div><br>
                            <div class="mb-3">
                                <label for="gender" class="form-label">Gender</label>&nbsp;
                                <input type="radio" name="gender" value="M" checked>Male&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="gender" value="F">Female
                            </div>
                            <div class="mb-3" style="margin-top: 30px">
                                <label for="ngaySinh" class="form-label">Date of birth</label> <input
                                    type="date" class="form-control" id="dob" name="dob">
                            </div>

                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone</label> <input
                                    type="tel" class="form-control"  pattern="[0]{1}[1-9]{9}" id="phone" name="phone">
                            </div>
                            <br>
                            <div>
                                <c:if test="${errorMessage!=null}">
                                    <p style="color: red;font-style:italic;margin-top: -4%;font-size: 20px">${errorMessage}</p>                                       
                                    <script>
                                        setTimeout(function () {
                                            window.location.href = 'register';
                                        }, 3000);
                                    </script>
                                </c:if>
                                <c:if test="${successMessage!=null}">
                                    <p style="color:green;font-style:italic;margin-top: -4%">${successMessage}</p>
                                    <script>
                                        setTimeout(function () {
                                            window.location.href = 'login';
                                        }, 5000);
                                    </script>
                                </c:if>
                            </div>
                        </div>
                        <div class="col-md-3"></div>
                        <div class="col-md-6">
                            <input class="btn btn-primary form-control" type="submit"
                                   value="Sign up" name="submit" id="submit" />
                        </div>
                        <div class="col-md-3"></div>
                    </div> 
                </form>
            </div>  


        </div>
        <script>
            function kiemTraMatKhau() {
                matKhau = document.getElementById("password").value;
                matKhauNhapLai = document.getElementById("comfirmpassword").value;
                if (matKhau != matKhauNhapLai) {
                    document.getElementById("msg").innerHTML = "Password do not match";
                    return false;
                } else {
                    document.getElementById("msg").innerHTML = "";
                    return true;
                }
            }
            ;
        </script>

    </body>
</html>

