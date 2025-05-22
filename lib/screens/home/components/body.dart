import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp/constants.dart';
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
          Row(
            children: <Widget>[
              FeaturePlantsCards(size: size,
              image: "assets/images/tanaman5.jpg",
              press:(){},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeaturePlantsCards extends StatelessWidget {
  const FeaturePlantsCards({
    super.key,
    required this.image,
    required this.size,
    required this.press,
  });

  final Size size;
  final String image;
  final VoidCallback press; 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press ,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding/2,
          bottom: kDefaultPadding / 2,
         ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit:BoxFit.cover,
            image: AssetImage(image)
          )
        ),
      ),
    );
  }
}

