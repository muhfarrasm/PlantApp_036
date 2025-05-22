import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp/constants.dart';
import 'package:plantapp/screens/details/components/icon_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
          height: size.height * 0.8,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 3 ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                        ),
                      ),

                      Spacer(),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: size.height * 0.03),

                        padding: EdgeInsets.all(kDefaultPadding / 2),
                        height: 62,
                        width: 62,
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 22,
                              color: kPrimaryColor.withOpacity(0.22),
                            ),

                            BoxShadow(
                              offset: Offset(-15, -15),
                              blurRadius: 22,
                              color: Colors.white,
                            )
                          ],

                        ),

                        
                      ),

                    ],
                  ),
                ),
              ),
              const IconCard(icon: "libassets/icons/sun.svg"),
              const IconCard(icon: "assets/icons/icon_3.svg"),
              const IconCard(icon: "assets/icons/icon_4.svg"),
              const IconCard(icon: "assets/icons/zap.svg"),
            ],
          ),
        ),
      ],
    );
  }
}

