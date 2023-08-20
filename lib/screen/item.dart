import 'package:day_37_with_flutter/const.dart';
import 'package:day_37_with_flutter/models/coffee.dart';
import 'package:day_37_with_flutter/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Item extends StatefulWidget {
  final Coffee coffee;
  Item({
    super.key,
    required this.coffee,
  });

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  int _quantity = 1;
  int _selectedIndex = 0;

  List<String> size = [
    "S",
    "M",
    "L",
  ];
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully added to cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.brown[800],
            size: 20,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              widget.coffee.imagePath,
              width: 100,
            ),
            SizedBox(
              height: 75,
            ),
            Text(
              "Q U A N T I T Y",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _quantity == 1
                      ? () {}
                      : () {
                          setState(() {
                            _quantity--;
                            widget.coffee.payment =
                                _quantity * widget.coffee.price;
                          });
                        },
                  icon: Icon(
                    Icons.horizontal_rule_rounded,
                  ),
                  color: Colors.grey[500],
                ),
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    _quantity.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _quantity == 10
                      ? () {}
                      : () {
                          setState(() {
                            _quantity++;
                            widget.coffee.payment =
                                _quantity * widget.coffee.price;
                          });
                        },
                  icon: Icon(Icons.add),
                  color: Colors.grey[500],
                ),
              ],
            ),
            SizedBox(
              height: 65,
            ),
            Text(
              "S I Z E",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: size.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      margin: EdgeInsets.all(5),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 19),
                      decoration: BoxDecoration(
                          color: _selectedIndex == index
                              ? Colors.brown[600]
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        size[index],
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.grey[500],
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 90,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                addToCart(widget.coffee);
              },
              child: Container(
                padding: EdgeInsets.all(25),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    "Add to cart | \$" +
                        widget.coffee.payment.toStringAsFixed(2),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
