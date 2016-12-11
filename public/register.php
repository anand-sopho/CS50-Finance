<?php

    // configuration
    require("../includes/config.php");

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // else render form
        render("register_form.php", ["title" => "Register"]);
    }

    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if(empty($_POST["username"]))
        {
            apologize ("Please enter Username");
        }
        
        else if(empty($_POST["password"]))
        {
            apologize ("Please enter Password");
        }
        
        else if(empty($_POST["confirmation"]))
        {
            apologize ("Please confirm your password");
        }
        
        if ($_POST["password"] !== $_POST["confirmation"] )
        {
            apologize ("Password do not match with confirmation");
        }
    
        else
        {
            $check = CS50::query("INSERT INTO users (username, hash, cash) VALUES(?, ?, 10000.0000)", $_POST["username"], password_hash($_POST["password"], PASSWORD_DEFAULT));
                if($check === false)
                {
                    apologize ("Username already exists.");
                }
            
                else
                {
                    $rows = CS50::query("SELECT LAST_INSERT_ID() AS id");
                    $id = $rows[0]["id"];
                    $_SESSION["id"] = $id;
                    redirect("index.php");
                }
        }
    }

?>