# A day at a coffee shop!

### User Flow

- User will get list of items from `items`.
- When user starts to add items, backend will create a `cart` from list of `items`. For each items, one  `cart_items` will be created.
- After creating each `cart_items`, backend will check discounts from `discounts` table and will insert into `cart_discounts` if any.
- Backend will always return the `cart` with `sub total`, `tax`, `discount amount` and `total`.
- User finally create the `order` after payment. The order will be created with default `Preparing` status. 
- We will have a background worker which will update the `status` of the `order` after every certain period of time.
- And based on the `status`, BE endpoint **api/v1/orders/notifications** will return `Preparing` and `Ready` orders.
- This notification endpoint **api/v1/orders/notifications** will be updated through websocket.
  

### Ruby version

  2.7.4

### Rails Version
  
  6.1.7

### Database ERD


![This is an image](public/ERD.png)



