


import 'dart:convert';

import 'package:flutter/services.dart';

void getUnboxingStock(){

}

Future<void> loadSnipData() async {
  final String data = await rootBundle.loadString('assets/vin/snip_list.json');
  final List<dynamic> jsonData = json.decode(data)['data'];
  print(jsonData);
}