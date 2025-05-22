import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';


class IconCard extends StatelessWidget {
  const IconCard({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(63),
          topRight: Radius.circular(63),
        ),
              
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 60,
            color: kPrimaryColor.withOpacity(0.29),
          ),
        ],
        image: DecorationImage(
          alignment: Alignment.centerLeft,
          fit: BoxFit.cover,
          image: AssetImage("lib/screens/details/components/body.dart assets/images/body.png"),
        ),
      ),
    );
  }
}
