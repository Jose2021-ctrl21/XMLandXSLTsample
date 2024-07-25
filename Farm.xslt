
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/store">
        <html>
            <head>
                <title>Store Products</title>
                <style>
                    html, body {
                        font-family: Arial, sans-serif;
                        background-size: cover;
                        margin: 0;
                        padding: 0;
                        height: 100%;
                        display: flex;
                        flex-direction: column;
                    }
                    nav {
                        position: fixed;
                        top: 0;
                        width: 100%;
                        height: 5rem;
                        background: tomato;
                        display: flex;
                        align-items: center;
                        justify-content:space-between;
                        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                 
                    }
                    .logout{
                        display:none;
                        padding:1rem;
                        background:chocolate;
                        border:none;
                        border-radius:10%;
                    }
                    .logout:hover{
                        cursor:pointer;
                        background:gold;
                    }
                    .main-content {
                        display: flex;
                        margin-top: 5rem;
                        flex-grow: 1;
                    }
                    .side-bar {
                        width: 30%;
                        background: tomato;
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        padding-top: 1rem;
                        box-shadow: 2px 0 4px rgba(0,0,0,0.1);
                    }
                    .side-bar a {
                        color: black;
                        text-decoration: none;
                        margin: 1rem 0;
                        font-weight: bold;
                    }
                    .side-bar a:hover{
                        background:red;
                        padding:1rem;
                    }
                    .container {
                        display: flex;
                        flex-wrap: wrap;
                        justify-content: center;
                        flex-grow: 1;
                        padding: 10px;
                    }
                    .product {
                        margin: 10px;
                        padding: 10px;
                        border: 1px solid #ccc;
                        border-radius: 5px;
                        flex: 1 1 calc(33.333% - 40px);
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        flex-direction: column;
                        box-sizing: border-box;
                        background: white;
                        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                    }
                    .product h3 {
                        margin: 0 0 5px 0;
                    }
                    .product .price {
                        color: #008000;
                        font-weight: bold;
                    }
                    .product .category {
                        color: #555;
                    }
                    .product:hover {
                        background: tomato;
                        transform: scale(1.1);
                        transition: transform 0.3s;
                    }
                    
                    a {
                        text-decoration: none;
                        color: inherit;
                    }
                    .footer {
                        background: tomato;
                        width: 100%;
                        height: 2rem;
                        text-align: center;
                        line-height: 2rem; /* Center the text vertically */
                    }
                    .login{
                        height:90%;
                        width:100%;
                        background:coral;
                        position:absolute;
                        display:flex;
                        justify-content:center;
                        align-items:center
                    }
                    .login .box{
                        width:15rem;
                        height:20rem;
                        display:flex;
                        justify-content:center;
                        align-items:center;
                        flex-direction:column;
                        background:chocolate;
                        border-radius:5%;
                    }
                    .login-submit{
                        width:74%;
                    }
                    .login-submit:hover{
                        background:coral;
                    }
                    .login .input-login{
                        padding:5px 5px;
                    }
                    .login-display{
                        display:none;
                    }
                    small a{
                        text-decoration:underline
                    }
                   
                </style>
            </head>
            <body>
                <nav>
                    <div></div>
                    <h1><xsl:value-of select="heading" /></h1>
                    <button class="logout" id="logout">logout?</button>
                    <div></div>
                </nav>
                <div class="main-content">
                    <div class="side-bar">
                        <a href="#">Vegetables</a>
                        <a href="#">Seedlings</a>
                        <a href="#">Fertilizers</a>
                        <a href="#">Pestilizers</a>
                        <a href="#">Farm tools</a>
                        <a href="#">Others</a>
                    </div>
                    <div class="container">
                        <xsl:for-each select="product">
                            <a href="https://pngtree.com/so/vegetables" target="_blank">
                                <div class="product">
                                    <h3><xsl:value-of select="name" /></h3>
                                    <div class="price">Price: $<xsl:value-of select="price" /></div>
                                    <div class="category">Category: <xsl:value-of select="scientificCategory" /></div>
                                </div>
                            </a>
                        </xsl:for-each>
                    </div>
                    <div class="login" id="login-id">
                        <div class="box">
                            <h1>Login</h1>
                            <input type="text" class="input-login" id="username"  placeholder="ex: siervo"/>
                            <br/>
                            <input type="text" class="input-login" id="password" placeholder="ex:siervo123"/>
                            <br/>
                            <input type="submit" class="login-submit">Login</input><br/>
                            <small>Already have an account?<a href="signup">Sign up</a></small>
                        </div>
                    </div>
                </div>
                <div class="footer">
                    All rights reserved 2024
                </div>
               
                <script>
                    var logout = document.getElementById("logout");
                    var loginId = document.getElementById("login-id");
                    var login = document.querySelector(".login");
                    const loginSubmit = document.querySelector(".login-submit");
                    loginSubmit.addEventListener("click", function(e){
                        e.preventDefault();
                        let username = document.getElementById("username").value;
                        let password = document.getElementById("password").value;
                        if(username==="siervo"){
                           if(password==="siervo123"){
                                loginId.classList.add("login-display");
                                loginId.classList.remove("login");
                                logout.style.display = "block"
                            }else{
                                alert("Invalid password");
                            }
                        }
                        else{
                            alert("Invalid username");
                        }       
                    })


                    logout.addEventListener("click",function(eve){
                        eve.preventDefault();
                        if(confirm("Do you want to logout?")){
                         loginId.classList.remove("login-display");
                         loginId.classList.add("login");
                         logout.style.display = "none"
                        }
                    })
                   
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>