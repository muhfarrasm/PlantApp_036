import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(
          6
        ),
              
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 22,
            color: kPrimaryColor.withOpacity(0.22),
          ),
          BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Colors.white,
          ),
        ],
        
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
