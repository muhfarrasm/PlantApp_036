import 'package:flutter/material.dart';
import 'package:plantapp/constants.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecomendPlantCard(
            image: "assets/images/tanaman1.jpeg",
            title: "Bulu atu",
            country: "Indonesia",
            price: 440,
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailsScreen(),
              //   ),
              // );
            },
          ),
      
          RecomendPlantCard(
            image: "assets/images/tanaman2.jpg",
            title: "Bulu bata",
            country: "Indonesia",
            price: 540,
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailsScreen(),
              //   ),
              // );
            },
          ),
      
          RecomendPlantCard(
            image: "assets/images/tanaman4.jpg",
            title: "Bulu ratu",
            country: "Indonesia",
            price: 540,
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailsScreen(),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    super.key, 
    required this.image, 
    required this.title, 
    required this.country, 
    required this.price, 
    required this.press,
    
  });

  final String image, title, country;
  final int price;
  final VoidCallback press;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft:Radius.circular(10),
                  bottomRight:Radius.circular(10),
                  ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: TextStyle(
                      fontSize: 14, // Sesuaikan ukuran
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
