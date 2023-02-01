class Formatter {
  double kelvin = 273.15;

  convert(double? celsius) {
    return (celsius! - kelvin);
  }
}
