import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/screens/details/components/icon_card.dart';

class ImagesandCons extends StatelessWidget {
  const ImagesandCons({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.8,
        child: Stack(
          children: <Widget>[
            // Background Image
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: size.height * 0.8,
                width: size.width * 0.75,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(63),
                    bottomLeft: Radius.circular(63),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 60,
                      color: kPrimaryColor.withOpacity(0.35),
                    ),
                  ],
                  image: const DecorationImage(
                    alignment: Alignment.topLeft,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/body.png"),
                  ),
                ),
              ),
            ),

           
            Positioned(
              left: 20, 
              top: 20,
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Column(
                  children: <Widget>[
                    IconButton(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                    ),
                    const Spacer(),
                    IconCard(icon: "assets/icons/sun.svg"),
                    IconCard(icon: "assets/icons/icon_3.svg"),
                    IconCard(icon: "assets/icons/icon_4.svg"),
                    IconCard(icon: "assets/icons/zap.svg"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
