import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/screens/details/components/icon_card.dart';
import 'package:plantapp/screens/details/components/image_and_icons.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImagesandCons(size: size),
          TittleAndPrice(
  title: "Muhammad Farras",
  country: "Indonesia",
  price: 440,
),
        ],
      ),
    );
  }
}

