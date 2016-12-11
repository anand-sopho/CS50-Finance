<?php

    require("../includes/config.php"); 
    
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if (empty($_POST["symbol"]))
        {
            apologize("Please enter the stock symbol.");
        }
        
        $stock = lookup($_POST["symbol"]);
        
        if ($stock === false)
        {
            apologize("Please enter a valid stock symbol.");
        }
        else
        {
            render("quote_price.php", ["symbol" => $stock["symbol"], "name" => $stock["name"], "price" => $stock["price"]]);
        }
    }
    else
    {
        render("quote_form.php", ["title" => "Quote"]);
    }
?>