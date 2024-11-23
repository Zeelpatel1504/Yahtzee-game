import 'dart:math';

class Dice {
  final List<int?> _values;
  final List<bool> _held;

  List<bool> get held => _held;

  Dice(int numDice)
      : _values = List<int?>.filled(numDice, null),
        _held = List<bool>.filled(numDice, false);
  List<int> get values => List<int>.unmodifiable(
        _values.where((value) => value != null).cast<int>(),
      );

  // List<int> get values => List<int>.unmodifiable(_values.whereNotNull());

  int? operator [](int index) => _values[index];

  bool isHeld(int index) => _held[index];

  void clear() {
    _values.fillRange(0, _values.length, null);
    _held.fillRange(0, _held.length, false);
  }

  void roll() {
    for (var i = 0; i < _values.length; i++) {
      if (!_held[i]) {
        _values[i] = Random().nextInt(6) + 1;
      }
    }
  }

  void holdClear() {
    _held.fillRange(0, _held.length, false);
  }

  void toggleHold(int index) {
    _held[index] = !_held[index];
  }
}
