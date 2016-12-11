<table class="table table-striped">

		<?php
				
			print("<tr>");
			print("<th>Transaction</th>");
			print("<th>Date/Time</th>");
			print("<th>Symbol</th>");
			print("<th>Shares</th>");
			print("<th>Price</th>");
			print("</tr>");
		
			foreach ($positions as $position)
			{	  
				print("<tr>");
				if($position["buy_share"]>0)
				{
	                print("<td>BUY</td>");
	                print("<td>{$position["date"]}</td>");
	                print("<td>{$position["buy_symbol"]}</td>");
	            	print("<td>{$position["buy_share"]}</td>");
	            	print("<td>{$position["price"]}</td>");
				}
				if($position["sell_share"]>0)
				{
					print("<td>SELL</td>");
	                print("<td>{$position["date"]}</td>");
	                print("<td>{$position["sell_symbol"]}</td>");
	            	print("<td>{$position["sell_share"]}</td>");
	            	print("<td>{$position["price"]}</td>");
				}
				print("</tr>");
			}
		?>
</table>
