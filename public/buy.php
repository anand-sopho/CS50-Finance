<?php
    require("../includes/config.php");
    
    if($_SERVER["REQUEST_METHOD"]=="GET")
    {
        render("buy_form.php");
    }
    
    else
    {
        $rows = CS50::query("SELECT * FROM users WHERE id = ?", $_SESSION["id"]);
        $stock=lookup($_POST["symbol"]);
        
        if($stock == false)
        {
            apologize ("Please enter a valid stock symbol.");
        }
        
        if (preg_match("/^\d+$/",$_POST["shares"]) == false)
        { 
            apologize("Please eneter a positive number of shares");
            
        }
            
        if((($stock["price"])*($_POST["shares"])) < ($rows[0]["cash"]))
        {
            $row = CS50::query("SELECT * FROM portfolio WHERE id = ?", $_SESSION["id"]);
            $row = CS50::query("INSERT INTO portfolio (id, symbol, shares) VALUES(?,?,?) ON DUPLICATE KEY UPDATE shares=shares+ VALUES(shares)", $_SESSION["id"], strtoupper($_POST["symbol"]), $_POST["shares"]);
            $price=(($stock["price"])*($_POST["shares"]));
            
            $history = CS50::query("SELECT * FROM History WHERE id = ?", $_SESSION["id"]);
            $history = CS50::query("INSERT INTO History (id, buy_symbol, buy_share, price) VALUES(?, ?,?, ?)", $_SESSION["id"], strtoupper($_POST["symbol"]), $_POST["shares"], (($stock["price"])*($_POST["shares"])));
        
            
            $rows = CS50::query("UPDATE users SET cash = cash - ?", $price);
            
            render("buy_final.php", ["shares"=> $_POST["shares"], "symbol"=>strtoupper($_POST["symbol"])]);
        }
    
        else
        {
            apologize("Please input smaller number");
        }
    }
?>