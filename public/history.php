<?php
  require("../includes/config.php");
  $rows = CS50::query("SELECT * FROM History WHERE id= ? ", $_SESSION["id"]);
  $positions = [];
    foreach ($rows as $row)
    {
        if ($row !== false)
        {
            $positions[] = [
                "date" => $row["date"],
                "buy_symbol" => $row ["buy_symbol"],
                "buy_share" => $row ["buy_share"],
                "sell_symbol" => $row ["sell_symbol"],
                "sell_share" => $row ["sell_share"],
                "price" => $row ["price"]
            ];
        }
    }
      render("history_final.php",  ["positions" =>$positions, "title" => "History"]); 
?>