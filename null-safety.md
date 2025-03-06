## Null Safety in Dart
### Null-aware Operators
#### `??`
`??` is a null operator returns expression on it's left, except if it is null and if so it returns the expression on it's right.

Example:
```dart
void main() {
  print(0 ?? 1); // 0
  print(1 ?? null); // 1
  print(null ?? null); // null
  print(null ?? null ?? 2); // 2
}
```
