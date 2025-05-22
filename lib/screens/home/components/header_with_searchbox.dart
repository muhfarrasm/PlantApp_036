import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plantapp/camera/home_camera.dart';

import 'package:plantapp/constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: kDefaultPadding),
                  child: Text(
                    'Hi Farras',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 60, // Ukuran diameter lingkaran
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Bentuk circular
                    border: Border.all(
                      color: Colors.white, // Warna border
                      width: 1.5, // Ketebalan border
                    ),
                  ),
                  child: ClipOval(
                    // Memastikan gambar terpotong menjadi lingkaran
                    child: Image.asset(
                      "assets/images/logo.jpg",
                      fit: BoxFit.cover, // Gambar akan menutupi area
                    ),
                  ),
                ),
                SizedBox(width: kDefaultPadding),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: kPrimaryColor),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const FullPage()),
                        );
                      },
                      child: SvgPicture.asset(
                        "assets/icons/camera.svg", // ikon kamera
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  Padding(
                    // Tambahkan Padding untuk ikon
                    padding: EdgeInsets.only(right: 25),
                    child: SvgPicture.asset(
                      "assets/icons/search.svg",
                      color: kPrimaryColor, // Sesuaikan warna
                      height: 20, // Atur ukuran
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
