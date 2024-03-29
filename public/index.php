<?php

    require("../includes/config.php"); 	
    
	$rows = CS50::query("SELECT symbol, shares FROM portfolio WHERE id = ?", $_SESSION["id"]);
				
	$positions = [];
	foreach ($rows as $row)
	{
	  $stock = lookup($row["symbol"]);
	  if ($stock !== false)
	  {
		  $positions[] = [
		  "name" => $stock["name"],
		  "price" => $stock["price"],
		  "shares" => $row["shares"],
		  "symbol" => $row["symbol"],
		  ];
	  }
	}
	  
	$cash = CS50::query("SELECT cash FROM users WHERE id = ?", $_SESSION["id"]);

    render("portfolio.php", ["title" => "Positions", "positions" => $positions, "cash" => $cash]);
?>