## Lists in Dart
Example 1: Managing a List of Characters

Defining a list structure and printing the list items.
```dart
void main() {
  // List of character names
  List<String> characterNames = ['Aether', 'Amber', 'Lisa', 'Kaeya'];
  
  // Display the list of characters
  print('Current Roster: $characterNames'); // Current Roster: [Aether, Amber, Lisa, Kaeya]
}
```
Adding a new item to the list.
```dart
...
  // Add a new character to the list
  characterNames.add('Razor');
  print('The new roster: $characterNames'); // The new roster: [Aether, Amber, Lisa, Kaeya, Razor]
}
```
Removing an item from the list.
```dart
...
  // Remove a character from the list
  characterNames.remove('Lisa');
  print('The new roster: $characterNames'); // The new roster: [Aether, Amber, Kaeya, Razor]
}
```
Accessing a list item using the index value.
```dart
...
  // Access a character by index
  print('First character: ${characterNames[0]}'); // First character: Aether
}
```
Iterating over the list.
```dart
...
  // Iterate over the list
  print('All Characters: ');
  for(String name in characterNames) {
    print(name);
  }
}

/* Output:
All Characters: 
Aether
Amber
Kaeya
Razor
*/
```

Example 2: Creating a List of Character Objects

Defining a `Character` class and managing a list of character objects.
```dart
class Character {
  String name;
  String element;
  String weaponType;
  
  Character(this.name, this.element, this.weaponType);
}

void main() {
  // List of character objects
  List<Character> characters = [
    Character('Aether', 'Anemo', 'Sword'),
    Character('Amber', 'Pyro', 'Bow'),
    Character('Lisa', 'Electro', 'Catalyst'),
    Character('Kaeya', 'Cryo', 'Sword'),
  ];
}
```
Displaying details of each character.
```dart
...
  // Display details of each character
  for(Character character in characters) {
    print('${character.name} - Element: ${character.element}, Weapon: ${character.weaponType}');
  }
}

/* Output:
Aether - Element: Anemo, Weapon: Sword
Amber - Element: Pyro, Weapon: Bow
Lisa - Element: Electro, Weapon: Catalyst
Kaeya - Element: Cryo, Weapon: Sword
*/
```
Adding a new list item.
```dart
...
  // Adding a new character
  characters.add(Character('Razor', 'Electro', 'Sword'));
  print('After adding Razor: ');
  for(Character character in characters) {
    print('${character.name} - Element: ${character.element}, Weapon: ${character.weaponType}');
  }
}

/* Output:
After adding Razor: 
Aether - Element: Anemo, Weapon: Sword
Amber - Element: Pyro, Weapon: Bow
Lisa - Element: Electro, Weapon: Catalyst
Kaeya - Element: Cryo, Weapon: Sword
Razor - Element: Electro, Weapon: Sword
*/
```
