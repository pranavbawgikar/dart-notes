import 'dart:io';

// Abstract class representing general items
abstract class Item {
  String name;
  double price;
  int quantity;
  String type;

  Item(this.name, this.price, this.quantity, this.type);

  // Method to calculate sales tax, implemented by the subclasses
  double calculateSalesTax();

  // Method to calculate final price
  double calculateFinalPrice() {
    return price + calculateSalesTax();
  }

  // Method to display item details
  void display() {
    double salesTax = calculateSalesTax();
    double finalPrice = calculateFinalPrice();
    print('Item name: $name');
    print('Item price: $price');
    print('Sales tax liability per item: $salesTax');
    print('Final price per item: $finalPrice');
    print('Total price for $quantity items: ${finalPrice * quantity}');
  }
}

// Class representing a raw item
class RawItem extends Item {
  RawItem(String name, double price, int quantity) : super(name, price, quantity, 'raw');

  double calculateSalesTax() {
    return 0.125 * price;
  }
}

// Class representing a manufactured item
class ManufacturedItem extends Item {
  ManufacturedItem(String name, double price, int quantity) : super(name, price, quantity, 'manufactured');

  double calculateSalesTax() {
    double basicTax = 0.125 * price;
    return basicTax + 0.02 * (price + basicTax);
  }
}

// Class representing an imported item
class ImportedItem extends Item {
  ImportedItem(String name, double price, int quantity) : super(name, price, quantity, 'imported');

  double calculateSalesTax() {
    double importDuty = 0.10 * price;
    double totalCost = price + importDuty;
    double surcharge;
    if(totalCost <= 100) {
      surcharge = 5;
    } else if(totalCost <= 200) {
      surcharge = 10;
    } else {
      surcharge = 0.05 * totalCost;
    }
    return importDuty + surcharge;
  }
}

// Function to parse a command-line argument and create an item
Item? parseArguments(List<String> args) {
  String? name;
  double? price;
  int? quantity;
  String? type;

  // Iterate over the arguments to extract values
  for(int i = 0; i < args.length; i++) {
    switch(args[i]) {
      case '-name':
        if(i + 1 < args.length) {
          name = args[++i];
        } else {
          print('Error: -name option requires a value.');
          return null;
        }
        break;
      case '-price':
        if(i + 1 < args.length) {
          price = double.tryParse(args[++i]);
          if(price == null) {
            print('Error: Invalid value for -price.');
            return null;
          }
        } else {
          print('Error: -price option requires a value.');
          return null;
        }
        break;
      case '-quantity':
        if(i + 1 < args.length) {
          quantity = int.tryParse(args[++i]);
          if(quantity == null) {
            print('Error: Invalid value for -quantity.');
            return null;
          }
        } else {
          print('Error: -quantity option requires a value.');
          return null;
        }
        break;
      case '-type':
        if(i + 1 < args.length) {
          type = args[++i].toLowerCase();
          if(type != 'raw' &&  type != 'manufactured' && type != 'imported') {
            print('Error: Invalid value for -type.');
            return null;
          }
        } else {
          print('Error: -type option requires a value.');
          return null;
        }
        break;
      default:
        print('Error: Unknown option ${args[i]}.');
        return null;
    }
  }

  // Validate mandatory fields
  if(name == null || price == null || quantity == null || type == null) {
    print('Error: Missing mandatory options.');
    return null;
  }

  // Create and return the appropriate item based on type
  switch(type) {
    case 'raw':
      return RawItem(name, price, quantity);
    case 'manufactured':
      return ManufacturedItem(name, price, quantity);
    case 'imported':
      return ImportedItem(name, price, quantity);
    default:
      print('Error: Unsupported item type');
      return null;
  }
}

void main(List<String> args) {
  // Continuously prompt the user to enter item details
  while(true) {
    // Parse command-line arguments to create an item
    Item? item = parseArguments(args);
    if(item != null) {
      // Display item details
      item.display();
    } else {
      // If parsing failed, prompt the user to re-enter details
      print('Please enter valid item details.');
    }

    // Ask if the user wants to enter another item
    stdout.write('Enter item details as command-line arguments: ');
    String? input = stdin.readLineSync();
    if(input == null) {
      break;
    }
    args = input.split(' ');
  }
}
