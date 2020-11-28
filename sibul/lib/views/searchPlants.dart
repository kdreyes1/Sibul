import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sibul/constants.dart';
import 'package:dio/dio.dart';
import 'package:sibul/views/showPlants.dart';

class SearchPlants extends StatefulWidget {
  final String value;
  SearchPlants(this.value, {Key key}) : super(key: key);

  @override
  _SearchPlantsState createState() => _SearchPlantsState(value);
}

class _SearchPlantsState extends State<SearchPlants> {
  static int page = 1;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  List plants = new List();
  final dio = new Dio();
  final String value;
  _SearchPlantsState(this.value);
  @override
  void initState() {
    this._getMoreData(page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels ==
          _sc.position.maxScrollExtent) {
             _getMoreData(page);
      }
    });
  }
 
  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

        ],
      ),
      body: Container(child: _gridPlants(),),
      resizeToAvoidBottomPadding: false,
    );
  }
  Widget _gridPlants(){
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      itemCount: plants.length+1,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:(orientation == Orientation.portrait) ? 2 : 3
      ), 
      itemBuilder: (BuildContext context, int index){
        if(index == plants.length){
          return _buildProgressIndicator();
        }else{
        return new FlatButton(
          onPressed: (){
            Navigator.of(context).push(
               MaterialPageRoute(builder: 
                (context)=> ShowPlant(plants[index]['id']),
               ) 
            );
          },
          child: GridTile(
            
            footer: Center(child:Text(plants[index]['slug'])),
            child: plants[index]['image_url'] == null ? Icon(Icons.nature):
            Image(
              fit:BoxFit.fill,
              image:NetworkImage(plants[index]['image_url']),
              
            ),
        )
        );
        }
      },
      controller: _sc,
      );
  }
  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var token = "3OifEjKfh_p8JM4tEF1_wVmSifZfM2y3Cxzx41vZHQw";
      var url = "https://trefle.io/api/v1/species/search?token=3OifEjKfh_p8JM4tEF1_wVmSifZfM2y3Cxzx41vZHQw&page=" +
          index.toString() +
          "&q="+value;
      print(url);
      try{
      final response = await dio.get(url);
      List tList = new List();
      for (int i = 0; i < response.data['data'].length; i++) {
        tList.add(response.data['data'][i]);
      }
      setState(() {
        isLoading = false;
        
        plants.addAll(tList);
        page++;
      });
      }on DioError catch (e){
        if(e.response.statusCode == 404){ 
        print(e.response.statusCode);
      }else{
        print(e.message);
        print(e.request);
      }
      }

    }
  }
 
  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}