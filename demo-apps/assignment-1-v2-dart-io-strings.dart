import 'dart:io';

enum ItemType { raw, manufactured, imported }

class Item {
  final String name;
  final double price;
  final int quantity;
  final ItemType type;

  Item({
    required this.name,
    required this.price,
    required this.quantity,
    required this.type
});

  double get salesTax {
    switch (type) {
      case ItemType.raw:
        return price * 0.125;
      case ItemType.manufactured:
        double basicTax = price * 0.125;
        return basicTax + (price + basicTax) * 0.02;
      case ItemType.imported:
        double importDuty = price * 0.10;
        double totalCost = price + importDuty;
        double surcharge;
        if(totalCost <= 100) {
          surcharge = 5;
        } else if(totalCost <= 200) {
          surcharge = 10;
        } else {
          surcharge = totalCost * 0.05;
        }
        return importDuty + surcharge;
    }
  }

  double get finalPrice => price + salesTax;

  String toString() {
    return 'Item Name: $name\n'
        'Item Price: ${price.toStringAsFixed(2)}\n'
        'Sales Tax: ${salesTax.toStringAsFixed(2)}\n'
        'Final Price: ${finalPrice.toStringAsFixed(2)}\n';
  }
}

void main(List<String> arguments) {
  print('Welcome to Item Entry System!');
  List<Item> items = [];

  while(true) {
    try {
      // Parse command-line arguments
      var args = _parseArguments(arguments);

      // Validate and retrieve item details
      String name = args['name'] ?? _prompt('Enter item name: ');
      double price = double.parse(args['price'] ?? _prompt('Enter item price: '));
      int quantity = int.parse(args['quantity'] ?? _prompt('Enter item quantity: '));
      ItemType type = _getItemType(args['type'] ?? _prompt('Enter item type (raw, manufactured, imported): '));

      // Create and add the item
      Item item = Item(name: name, price: price, quantity: quantity, type: type);
      items.add(item);

      // Display item details
      print('Item details:\n ');
      print(item);

      // Ask if the user wants to enter another item
      String? continueInput = _prompt('Do you want to enter details of another item (y/n): ').toLowerCase();
      if(continueInput != 'y') {
        break;
      }
    } catch(e) {
      print('Error: ${e.toString()}');
    }
  }

  // Display all entered items
  print('\nAll entered items');
  for(var item in items) {
    print(item);
  }
}

Map<String, String> _parseArguments(List<String> arguments) {
  var args = <String, String>{};
  for(int i = 0; i < arguments.length; i += 2) {
    if(i + 1 < arguments.length) {
      args[arguments[i].replaceFirst('-', '')] = arguments[i + 1];
    }
  }
  return args;
}

String _prompt(String message) {
  stdout.write(message);
  return stdin.readLineSync() ?? '';
}

ItemType _getItemType(String input) {
  switch(input.toLowerCase()) {
    case 'raw':
      return ItemType.raw;
    case 'manufactured':
      return ItemType.manufactured;
    case 'imported':
      return ItemType.imported;
    default:
      throw ArgumentError('Invalid item type: $input');
  }
}
