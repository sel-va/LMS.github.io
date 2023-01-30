3-topping pizzas will be sold for a fixed price, and are trying to understand the costs involved.

Notes:
Do not display pizzas where a topping is repeated. For example, ‘Pepperoni,Pepperoni,Onion Pizza’.
Ingredients must be listed in alphabetical order. For example, 'Chicken,Onions,Sausage'. 'Onion,Sausage,Chicken' is not acceptable.

topping_name	ingredient_cost
Pepperoni		0.50
Sausage			0.70
Chicken			0.55
Extra Cheese	0.40


Example Output:
pizza							total_cost
Chicken,Pepperoni,Sausage		1.75
Chicken,Extra Cheese,Sausage	1.65
Extra Cheese,Pepperoni,Sausage	1.60
Chicken,Extra Cheese,Pepperoni	1.45

Solution #1: Using INNER JOIN
/*
Step 1: Join the tables thrice horizontally

	SELECT *
	FROM pizza_toppings AS p1
	INNER JOIN pizza_toppings AS p2
	  ON p1.topping_name < p2.topping_name 
	INNER JOIN pizza_toppings AS p3
	  ON p2.topping_name < p3.topping_name;

	Important tip: Instead of matching the tables on columns using the equal sign =, we use the less than sign < to ensure that:

	There is no duplication of the ingredients across each row.
	The ingredients are arranged in an alphabetical manner from left to right.
	Showing the output of the first 3 rows:

	topping_name	ingredient_cost	topping_name	ingredient_cost	topping_name	ingredient_cost
	Pepperoni		0.50			Sausage			0.70			Spinach			0.30

Step 2: Combine pizza toppings and add the ingredients

	To combine the 3 toppings into a single string, we can either use the CONCAT() function or pipe ||.

	CONCAT(expression1, expression2, expression3, ...)
	expression1 || expression2 || expression3

	SELECT 
	  CONCAT(p1.topping_name, ',', p2.topping_name, ',', p3.topping_name) AS pizza,
	  p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost AS total_cost
	FROM pizza_toppings AS p1
	INNER JOIN pizza_toppings AS p2
	  ON p1.topping_name < p2.topping_name 
	INNER JOIN pizza_toppings AS p3
	  ON p2.topping_name < p3.topping_name;
	pizza	total_cost
	Pepperoni,Sausage,Spinach	1.50
	Pepperoni,Pineapple,Sausage	1.45
	Pepperoni,Pineapple,Spinach	1.05
	Step 3: Order the output accordingly

Finally, order the output by the highest cost at the top and to break ties, sort the pizza ingredients in ascending order (it also means sort in alphabetical order.
*/
	SELECT 
	  CONCAT(p1.topping_name, ',', p2.topping_name, ',', p3.topping_name) AS pizza,
	  p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost AS total_cost
	FROM pizza_toppings AS p1
	INNER JOIN pizza_toppings AS p2
	  ON p1.topping_name < p2.topping_name 
	INNER JOIN pizza_toppings AS p3
	  ON p2.topping_name < p3.topping_name 
	ORDER BY total_cost DESC, pizza;
