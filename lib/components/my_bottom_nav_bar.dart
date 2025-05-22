import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/maps/home_page.dart';


class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/flower.svg",
              color: kPrimaryColor,
            ),
          ),

          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            icon: SvgPicture.asset("assets/icons/map-pin.svg"),
          ),

          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/user.svg"),
          ),
        ],
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    centerTitle: true,
    leadingWidth: 48,
    leading: IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        "assets/icons/icons8-menu.svg",
        color: Colors.white,
      ),
    ),
    title: Text(
      "Home",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}
