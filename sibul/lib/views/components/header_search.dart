import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sibul/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibul/views/searchPlants.dart';
import 'package:sibul/views/components/RandomPlants.dart';


class HeaderWithSearch extends StatelessWidget {
  const HeaderWithSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var focusNode = FocusNode(onKey: (node, event) {
    if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
        
    }
    return false;

    }); 
    return Container(
      margin: EdgeInsets.only(bottom: 12 * 2.5),
      child: Stack(children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          child: Row(
            children: [
              Text(
                "Welcome to Sibul",
                style: GoogleFonts.poppins(
                    fontSize: 28,
                    // fontWeight: FontWeight.bold,
                    textStyle: TextStyle(color: Colors.white)),
              ),
              Spacer() // add another button here
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 54,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: primaryColor.withOpacity(0.23))
              ],
            ),
            child: TextField(
              focusNode: focusNode,
              textInputAction: TextInputAction.search,
              onSubmitted: (value){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=> SearchPlants(value))
                );
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: primaryColor.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: Icon(
                  Icons.search,
                  color: primaryColor,
                ),
              ),
              cursorColor: primaryColor,
            ),
          ),
        )
      ]),
    );
  }
}
