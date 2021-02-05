class CalculatorBox {
  CalculatorBox({this.amount, this.rate, this.time});
  final int amount;
  final int rate;
  final int time;
  double _si;
  double _total;
  String calculateSI() {
    _si = (amount * rate * time) / 100;
    _total = _si + amount;

    return _si.toStringAsFixed(1);
  }

  String result() {
    return "Return is $_si and total is $_total";
  }
}
