<div id="message">
		<h3> Your current balance is
		<b><?=sprintf("%.2f",$cash[0]["cash"]) ?></b> $.  </h3>
		<br/>	
</div>
	<table class="table table-striped">
	<thead>
        <tr>
	        <th>Symbol</th>
	        <th>Name</th>
	        <th>Shares</th>
	        <th>Price</th>
        </tr>
    </thead>
    
    <tbody>

		<?php foreach ($positions as $position): ?>
		
			<tr>    
        	<td><?= $position["symbol"] ?></td>
        	<td><?= $position["name"] ?></td>
        	<td><?= $position["shares"] ?></td>
        	<td><?= "$" . $position["price"] ?></td>
   			</tr>
   			<?php endforeach ?>
	</tbody>
</table>