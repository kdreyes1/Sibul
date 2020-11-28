import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowPlant extends StatefulWidget {
  final int plantID;
  ShowPlant(this.plantID, {Key key}) : super(key: key);

  @override
  _ShowPlantState createState() => _ShowPlantState(plantID);
}

class _ShowPlantState extends State<ShowPlant> {
  final int plantID;
  _ShowPlantState(this.plantID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(''),
      ),
    );
  }
}
