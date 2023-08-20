import 'package:day_37_with_flutter/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
      name: 'Latte',
      price: 4.15,
      imagePath: "lib/images/coffee-latte.png",
      payment: 4.15,
    ),
    Coffee(
      name: 'Hot Coffee',
      price: 4.60,
      imagePath: "lib/images/hot-coffee.png",
      payment: 4.60,
    ),
    Coffee(
      name: 'Espresso',
      price: 3.50,
      imagePath: "lib/images/expresso.png",
      payment: 3.50,
    ),
    Coffee(
      name: 'Ice Coffee',
      price: 5.70,
      imagePath: "lib/images/ice-coffee.png",
      payment: 5.70,
    ),
  ];

  List<Coffee> _userCart = [];

  List<Coffee> get coffeShop => _shop;

  List<Coffee> get userCart => _userCart;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  double lastPayment() {
    double lastpay = 0.0;
    if(_userCart.length == 0){
      return 0.0;
    }
    else{
      for (int i = 0; i < _userCart.length; i++) {
       lastpay += _userCart[i].payment;
    }
    return lastpay;
    }
    
  }
}
