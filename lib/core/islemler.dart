import 'dart:math';

List<dynamic> iyimserlikKazanc(List<List<String>> _matris) {
  double max = double.parse(_matris[0][0]);
  int rowIndex = 0;

  for (int i = 0; i < _matris.length; i++) {
    for (int j = 0; j < _matris[i].length; j++) {
      if (double.parse(_matris[i][j]) > max) {
        max = double.parse(_matris[i][j]);
        rowIndex = i;
      }
    }
  }
  return [max, rowIndex];
}

List<dynamic> iyimserlikMaliyet(List<List<String>> _matris) {
  double min = double.parse(_matris[0][0]);
  int rowIndex = 0;

  for (int i = 0; i < _matris.length; i++) {
    for (int j = 0; j < _matris[i].length; j++) {
      if (double.parse(_matris[i][j]) < min) {
        min = double.parse(_matris[i][j]);
        rowIndex = i;
      }
    }
  }
  return [min, rowIndex];
}

List<double> esOlasilik(List<List<String>> _matris) {
  List<double> averages = [];
  for (int i = 0; i < _matris.length; i++) {
    double sum = 0;
    for (int j = 0; j < _matris[i].length; j++) {
      sum += double.parse(_matris[i][j]);
    }
    averages.add(sum / _matris[i].length);
  }
  return averages;
}

List<double> hurwicz(List<List<String>> _matris, alfaKatsayisi) {
  List<double> totals = [];
  for (int i = 0; i < _matris.length; i++) {
    double max = double.parse(_matris[i][0]);
    double min = double.parse(_matris[i][0]);
    for (int j = 1; j < _matris[i].length; j++) {
      if (double.parse(_matris[i][j]) > max) {
        max = double.parse(_matris[i][j]);
      }
      if (double.parse(_matris[i][j]) < min) {
        min = double.parse(_matris[i][j]);
      }
    }
    totals.add((max * alfaKatsayisi) + (min * (1 - alfaKatsayisi)));
  }

  return totals;
}

List<double> kotumserlikListKazanc(
  List<List<String>> _matris,
) {
  List<double> minimumValues = [];
  for (int i = 0; i < _matris.length; i++) {
    double minimumValue = double.parse(_matris[i][0]);
    for (int j = 1; j < _matris[i].length; j++) {
      if (double.parse(_matris[i][j]) < minimumValue) {
        minimumValue = double.parse(_matris[i][j]);
      }
    }
    minimumValues.add(minimumValue);
  }
  return minimumValues;
}

List<double> kotumserlikListMaliyet(
  List<List<String>> _matris,
) {
  List<double> maximumValues = [];
  for (int i = 0; i < _matris.length; i++) {
    double maximumValue = double.parse(_matris[i][0]);
    for (int j = 1; j < _matris[i].length; j++) {
      if (double.parse(_matris[i][j]) > maximumValue) {
        maximumValue = double.parse(_matris[i][j]);
      }
    }
    maximumValues.add(maximumValue);
  }
  return maximumValues;
}

List<dynamic> findMaximum<T extends double>(List<T> list) {
  T maximum = list[0];
  int maximumIndex = 0;

  for (int i = 1; i < list.length; i++) {
    if (list[i] > maximum) {
      maximum = list[i];
      maximumIndex = i;
    }
  }

  return [maximum, maximumIndex];
}

List<dynamic> findMinimum<T extends double>(List<T> list) {
  T minimum = list[0];
  int minimumIndex = 0;

  for (int i = 1; i < list.length; i++) {
    if (list[i] < minimum) {
      minimum = list[i];
      minimumIndex = i;
    }
  }

  return [minimum, minimumIndex];
}
