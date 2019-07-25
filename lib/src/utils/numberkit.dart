import 'dart:math';

class NumberKit {

    /// Generates a positive random integer uniformly distributed on the range
    /// from [min], inclusive, to [max], exclusive.
  static int randomInt(int min, int max) {
    final _random = new Random();
    int result = min + _random.nextInt(max - min);
    return result;
  }

  static int min(int a, int b){
    return a > b ? b : a;
  }

  static int max(int a, int b){
    return a < b ? b : a;
  }
  
}