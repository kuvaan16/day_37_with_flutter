import 'dart:ffi';

class Coffee {
  final String name;
  final double price;
  final String imagePath;
   double payment;

  Coffee({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.payment
  });
}
