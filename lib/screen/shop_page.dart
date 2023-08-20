import 'package:day_37_with_flutter/components/coffee_tile.dart';
import 'package:day_37_with_flutter/const.dart';
import 'package:day_37_with_flutter/models/coffee.dart';
import 'package:day_37_with_flutter/models/coffee_shop.dart';
import 'package:day_37_with_flutter/screen/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: value.coffeShop.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.coffeShop[index];

                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Item(coffee: eachCoffee),)),
                      icon: Icon(Icons.arrow_forward),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
