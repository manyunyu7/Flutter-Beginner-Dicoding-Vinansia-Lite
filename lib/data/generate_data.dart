


import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vinansia_lite/data/snip_response_dto.dart';
import 'package:vinansia_lite/data/unboxing_sectoral_response_dto.dart';
import 'package:vinansia_lite/data/unboxing_stock_response_dto.dart';


Future<UnboxingStockResponseDto> loadStockData() async {
  // Load JSON data from the asset file
  final String data = await rootBundle.loadString('assets/vin/unboxing_stock.json');

  // Parse JSON data into a List<dynamic>
  final jsonData = json.decode(data);
  print(jsonData);
  // Assuming SnipItemDto has a factory constructor named 'fromJson'
  return UnboxingStockResponseDto.fromJson(jsonData);
}


Future<UnboxingSectoralResponseDto> loadSectoralData() async {
  // Load JSON data from the asset file
  final String data = await rootBundle.loadString('assets/vin/unboxing_sectoral.json');

  // Parse JSON data into a List<dynamic>
  final jsonData = json.decode(data);
  print(jsonData);
  // Assuming SnipItemDto has a factory constructor named 'fromJson'
  return UnboxingSectoralResponseDto.fromJson(jsonData);
}

Future<SnipResponseDto> loadSnipData() async {
  // Load JSON data from the asset file
  final String data = await rootBundle.loadString('assets/vin/snip_list.json');

  // Parse JSON data into a List<dynamic>
  final jsonData = json.decode(data);
  print(jsonData);
  // Assuming SnipItemDto has a factory constructor named 'fromJson'
  return SnipResponseDto.fromJson(jsonData);
}