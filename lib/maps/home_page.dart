import 'package:flutter/material.dart';
import 'package:plantapp/maps/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? alamtDipilih;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pilih Alamat'),
                  IconButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapPage(),
                        ),
                      );
                      if (result != null) {
                        setState(() {
                          alamtDipilih = result;
                        });
                      }
                    },
                    icon: const Icon(Icons.map, color: Colors.blue),
                  ),
                ],
              ),

              alamtDipilih == null
                  ? const Text('Tidak ada alamt yang dipilih!')
                  : Text(alamtDipilih!),
            ],
          ),
        ),
      ),
    );
  }
}
