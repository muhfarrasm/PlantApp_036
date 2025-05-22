import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/screens/home/components/featured_plants.dart';
import 'package:plantapp/screens/home/components/header_with_searchbox.dart';
import 'package:plantapp/screens/home/components/recomend_plants.dart';
import 'package:plantapp/screens/home/components/title_with_more_btn.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(
            title: "Rekomendasi Tanaman",
            press: () {
              // Bisa tambahkan aksi navigasi atau log
              print("Lihat lebih banyak tanaman");
            },
          ),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Feature Plants", press: (){}),
          FeaturedPlants(size: size),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}

