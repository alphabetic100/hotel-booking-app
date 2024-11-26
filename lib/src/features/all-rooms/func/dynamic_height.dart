double dynamicHeight(int length, double screenHeight) {
  List<double> dynamicHeight = [
    screenHeight * 0.3,
    screenHeight * 0.2,
    screenHeight * 0.4,
  ];

  int height = length % dynamicHeight.length;
  dynamicHeight.shuffle();

  return dynamicHeight[height];
}
