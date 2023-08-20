import 'package:day_37_with_flutter/components/coffee_tile.dart';
import 'package:day_37_with_flutter/const.dart';
import 'package:day_37_with_flutter/models/coffee.dart';
import 'package:day_37_with_flutter/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  double lastpay() {
    double last = Provider.of<CoffeeShop>(context, listen: false).lastPayment();
    return last;
  }

  void payNow() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),
              value.userCart.length == 0
                  ? Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height - 300,
                      child: Text(
                        "No Item added..",
                        style: TextStyle(
                          color: Colors.brown[900],
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: value.userCart.length,
                        itemBuilder: (context, index) {
                          Coffee eachCoffee = value.userCart[index];

                          return CoffeeTile(
                              coffee: eachCoffee,
                              onPressed: () => removeFromCart(eachCoffee),
                              icon: Icon(Icons.delete));
                        },
                      ),
                    ),
              value.userCart.length == 0
                  ? Container()
                  : GestureDetector(
                      onTap: payNow,
                      child: Container(
                        padding: EdgeInsets.all(25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Pay Now | \$" + lastpay().toStringAsFixed(2),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
