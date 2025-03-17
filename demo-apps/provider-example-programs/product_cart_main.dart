import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import 'package:untitled/models/product_cart_model.dart';
import 'package:untitled/providers/cart_provider.dart';
import 'package:untitled/providers/product_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => ProductScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    )
  );
}

class ProductScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    var products = productProvider.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Badge(
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  icon: Icon(Icons.shopping_cart)
                ),
                // label: Text(cart.items.length.toString()),
              );
            }
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return ProductTile(product: product);
      }),
    );
  }
}

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile({ required this.product });

  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return ListTile(
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: Icon(Icons.add_shopping_cart),
        onPressed: () {
          cartProvider.addToCart(product);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${product.name} added to your cart')),
          );
        },
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var cartItems = cartProvider.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                CartItem cartItem = cartItems[index];
                return CartItemTile(cartItem: cartItem);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;

  CartItemTile({ required this.cartItem });

  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return ListTile(
      title: Text(cartItem.product.name),
      subtitle: Text(
        '${cartItem.quantity} x \$${cartItem.product.price.toStringAsFixed(2)}',
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          cartProvider.removeFromCart(cartItem.product.id);
        },
      ),
    );
  }
}
