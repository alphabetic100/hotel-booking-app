int amountCalculator(int price, int rooms) {
  return price * rooms;
}

double totalAmountCalculator(int price, int rooms, double tax) {
  int amount = price * rooms;
  double total = amount + (amount * (tax / 100));
  return total;
}
