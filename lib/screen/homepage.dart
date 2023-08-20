import 'package:day_37_with_flutter/components/bottom_nav_bar.dart';
import 'package:day_37_with_flutter/components/side_bar.dart';
import 'package:day_37_with_flutter/const.dart';
import 'package:day_37_with_flutter/screen/cart_page.dart';
import 'package:day_37_with_flutter/screen/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    ShopPage(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: SideBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: InkWell(
          onTap: () {
            _scaffoldState.currentState?.openDrawer();
          },
          child: Icon(
            FontAwesomeIcons.barsStaggered,
            size: 18,
            color: Colors.brown[700],
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
