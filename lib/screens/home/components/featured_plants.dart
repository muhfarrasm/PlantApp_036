import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';

class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeaturePlantsCards(size: size,
          image: "assets/images/tanaman5.jpg",
          press:(){},
          ),
      
          FeaturePlantsCards(size: size,
          image: "assets/images/tanaman4.jpg",
          press:(){},
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

