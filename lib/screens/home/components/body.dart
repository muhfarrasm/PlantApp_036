import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.2,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.2 - 27,
                decoration: BoxDecoration(color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36)
                )
                ),
              ),
              Positioned(child: Container(
                margin: EdgeInsets.symmetric(horizontal: KDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white
                ),


              ),
              ),
            ],
          ),
        )
      ],
    );
  }
}