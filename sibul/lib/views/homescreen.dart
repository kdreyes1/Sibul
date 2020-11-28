import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibul/constants.dart';
import 'package:sibul/views/components/header_search.dart';
import 'package:sibul/views/components/RandomPlants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          HeaderWithSearch(),
          Container(
            child: Center(
              child: Text(
                "Plant of the Day",
                style: GoogleFonts.poppins(fontSize: 20),
              ),
            ),
          ),
          RandomPlants()
        ],
      ),
    );
  }
}


