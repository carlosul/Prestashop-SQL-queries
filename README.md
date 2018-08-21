# Prestashop-SQL-queries
These are some handy Prestashop SQL queries that I programmed for my e-commerce. 

removeOrderDuplications.SQL  
These code eliminates order duplications that appear when order statuses are not configured correctly.

customersNoReviews.SQL  
Retrieves data for emailing containing customers that have ordered more than once and didn't leave a review on the page.
Posible customizations:
c.id_lang = 4: selects the language of the customers
Where 'newsletter' = 1: for filtering only opt-in clients
o.date_add BETWEEN DATE_SUB(NOW(), INTERVAL 15 DAY) AND NOW(): ordered in the past 15 days

newsletterWhole.SQL  
Retrieves data from customers that signed to the newsletter via the account creation or the newsletter footer addon.

orderReferencesWeight.SQL  
For exporting orders with number references and weights. Useful for checking carrier's billing
