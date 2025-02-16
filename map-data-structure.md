## Map Data Structure
Example:
```dart
void main() {
  // Define a map to hold player attributes
  Map<String, int> playerStats = {
    'health': 100,
    'mana': 50,
    'strength': 75,
    'agility': 60,
  };
  
  // Define a map to hold inventory items and their quantities
  Map<String, int> inventory = {
    'potion': 3,
    'elixir': 2,
    'bomb': 1,
  };
  
  // Access and display player's health
  print('Player Health: ${playerStats['health']}');
  
  // Update player's mana
  playerStats['mana'] = 65;
  print('Updataed Mana: ${playerStats['mana']}');
  
  // Add a new attribute for defense in playerStats
  playerStats['defense'] = 40;
  print('Player Defense: ${playerStats['defense']}');
  
  // Iterate over all attributes of playerStats
  playerStats.forEach((attribute, value) {
    print('$attribute: $value');
  });
  
  // Function to add an item to the inventory
  void addItem(String item, int quantity) {
    if(inventory.containsKey(item)) {
      inventory[item] = quantity++;
    } else {
      inventory[item] = quantity;
    }
  }
  
  // Function to remove an item from the iventory
  void removeItem(String item, int quantity) {
    int currentQuantity = inventory[item] ?? 0;
    if(currentQuantity >= quantity) {
      inventory[item] = currentQuantity - quantity;
      if(inventory[item] == 0) {
        inventory.remove(item);
      }
    } else {
    print('Not enough $item in the inventory.');
    }
  }
  
  // Add items to the inventory
  addItem('potion', 3);
  addItem('phoenix_down', 1);
  
  // Remove an item from the inventory
  removeItem('elixir', 1);
  
  // Display current inventory
  print('Current Inventory: ');
  inventory.forEach((item, quantity) {
    print('$item: $quantity');
  });
}
```
