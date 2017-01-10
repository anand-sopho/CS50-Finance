<?php

    require("../includes/config.php"); 
    
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        render("../views/sell_form.php");
    }
    
    else
    {
        $stock=lookup($_POST["symbol"]);
        
        if ($stock == false)
        {
            apologize ("Please enter a valid symbol");
        }
        
        $rows = CS50::query ("SELECT * FROM portfolio WHERE id = ? AND symbol=?", $_SESSION["id"], strtoupper($_POST["symbol"]));
    
        if (count($rows) == 0)
        {
            apologize ("Please enter a stock that you own.");
        }
        
        else if ($_POST["shares"]>$rows[0]["shares"])
        {
            apologize ("Please input less than or equal to what you own");
        }
                
        $stocks= ($_POST["shares"])*($stock["price"]);
        
        $row= CS50::query("UPDATE portfolio SET shares=shares-? WHERE id=? AND symbol=?", $_POST["shares"],  $_SESSION["id"], strtoupper($_POST["symbol"]));
        $row= CS50::query("UPDATE users SET cash=cash+? WHERE id = ?", $stocks, $_SESSION["id"]);
        
        $history = CS50::query("SELECT * FROM History WHERE id = ?", $_SESSION["id"]);
        $history = CS50::query("INSERT INTO History (id, sell_symbol, sell_share, price) VALUES(?, ?,?, ?)", $_SESSION["id"], strtoupper($_POST["symbol"]),  $_POST["shares"], (($stock["price"])*($_POST["shares"])));
        
        //CS50::query("DELETE FROM portfolio WHERE id = ? AND symbol = ?", $_SESSION["id"], $_POST["symbol"]);
        
        render ("sell_final.php", ["symbol" => $stock ["symbol"],"shares" => $_POST["shares"], ]);        
                    
    }
