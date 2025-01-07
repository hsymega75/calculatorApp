class CalculatorLogic {
  double? firstValue;
  String? operation;

  String calculate(String display) {
    if (firstValue == null || operation == null) {
      return display;
    }

    double secondValue = double.tryParse(display) ?? 0.0;
    double result;

    switch (operation) {
      case '+':
        result = firstValue! + secondValue;
        break;
      case '-':
        result = firstValue! - secondValue;
        break;
      case '×':
        result = firstValue! * secondValue;
        break;
      case '÷':
        if (secondValue == 0) {
          return "Error";
        }
        result = firstValue! / secondValue;
        break;
      default:
        return display;
    }

    // 結果を出力
    return result % 1 == 0 ? result.toInt().toString() : result.toString();
  }

  void setFirstValue(String value) {
    firstValue = double.tryParse(value);
  }

  void setOperation(String op) {
    operation = op;
  }

  void reset() {
    firstValue = null;
    operation = null;
  }
}
