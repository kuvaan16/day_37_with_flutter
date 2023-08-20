import 'package:day_37_with_flutter/screen/homepage.dart';
import 'package:day_37_with_flutter/screen/introduction.dart';
import 'package:day_37_with_flutter/screen/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Image.asset(
              "lib/images/coffee.png",
              width: 100,
            ),
            SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.home,
                  size: 20,
                  color: Colors.brown[700],
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.brown[700],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.circleInfo,
                size: 20,
                color: Colors.brown[700],
              ),
              title: Text(
                "About",
                style: TextStyle(
                  color: Colors.brown[700],
                ),
              ),
            ),
            SizedBox(
              height: 300,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Introduction(),
                    ));
              },
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 20,
                  color: Colors.brown[700],
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.brown[700],
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
