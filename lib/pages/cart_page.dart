import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CartItem> cartItems = [
      CartItem(name: 'Product 1', price: 19.99, quantity: 2, imageUrl: 'https://via.placeholder.com/50'),
      CartItem(name: 'Product 2', price: 29.99, quantity: 1, imageUrl: 'https://via.placeholder.com/50'),
      CartItem(name: 'Product 3', price: 9.99, quantity: 3, imageUrl: 'https://via.placeholder.com/50'),
    ];

    double total = cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemTile(item: cartItems[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: \$${total.toStringAsFixed(2)}', 
                    style: Theme.of(context).textTheme.titleLarge),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement checkout functionality
                  },
                  child: const Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  int quantity;
  final String imageUrl;

  CartItem({required this.name, required this.price, required this.quantity, required this.imageUrl});
}

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: Theme.of(context).textTheme.titleMedium),
                  Text('\$${item.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    // TODO: Implement decrease quantity
                  },
                ),
                Text('${item.quantity}'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // TODO: Implement increase quantity
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
