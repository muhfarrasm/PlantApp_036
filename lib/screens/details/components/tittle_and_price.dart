import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';


class TittleAndPrice extends StatelessWidget {
  const TittleAndPrice({
    
    super.key,

    required this.title,
  required this.country,
  required this.price,
  });

  final String title, country;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding
      ),
      child: Row(
        children: <Widget>[
          RichText(text: TextSpan(
            children: [
              TextSpan(
                text: "$title",
                 style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: kTextColor,
                        ),
              ),
      
              TextSpan(
                text: "$country",
                style: TextStyle(
                  fontSize: 20,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w300,
                )
              )
             
            ],
          ),
          ),
    
          Spacer(),
          Text("\$$price", style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: kPrimaryColor),)
        ],
      ),
    );
  }
}

