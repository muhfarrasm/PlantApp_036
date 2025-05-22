import 'package:flutter/material.dart';
import 'package:plantapp/components/my_bottom_nav_bar.dart';
import 'package:plantapp/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BodyPage(),
      bottomNavigationBar: MyBottomNavBar(), // Tambahkan body kosong jika diperlukan
    );
  }
}

