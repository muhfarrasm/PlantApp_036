import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: true, 
        leadingWidth: 48, 
        leading: IconButton(
          onPressed: (){},
          icon: SvgPicture.asset(
            "assets/icons/icons8-menu.svg",
            color: Colors.white, 
          ),
        ),
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(), // Tambahkan body kosong jika diperlukan
    );
  }
}