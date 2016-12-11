
<?php
    require("../includes/config.php");
    
    if($_SERVER["REQUEST_METHOD"]=="GET")
    {
        render("deposit_form.php", ["title" => "Deposit Form"]);
    }
    
    else {
        
        if (preg_match("/^\d+$/", $_POST["deposit"]) == false)
        {
            apologize("Please enter a positive number.");
        }
        
        CS50::query("UPDATE users SET cash = cash + ? WHERE id = ?", $_POST["deposit"], $_SESSION["id"]);
        
        redirect("/");
        
    }
    
?>