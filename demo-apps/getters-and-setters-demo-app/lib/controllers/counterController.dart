class Countercontroller {
  int _roll = 10;

  set setRoller(int number) {
    _roll = number;
  }

  int get getRoll => _roll; // This getter helps us grab the value of `_roll` since it's private
}
