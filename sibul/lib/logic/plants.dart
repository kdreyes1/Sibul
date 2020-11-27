import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';


var _token = "3OifEjKfh_p8JM4tEF1_wVmSifZfM2y3Cxzx41vZHQw";

String sample = "https://trefle.io/api/v1/plants?token=" + _token +"&filter%5Bcommon_name%5D=beach%20strawberry";

class Plants {
  String text;

  Future <void> fetchData() async {
    Response response = await get(sample);
    Map data = jsonDecode(response.body);
    text = data['text'];
  }
}