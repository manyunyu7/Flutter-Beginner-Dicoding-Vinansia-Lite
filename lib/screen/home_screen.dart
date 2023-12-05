import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinansia_lite/data/generate_data.dart';
import 'package:vinansia_lite/data/snip_response_dto.dart';
import 'package:vinansia_lite/data/unboxing_sectoral_response_dto.dart';
import 'package:vinansia_lite/data/unboxing_stock_response_dto.dart';
import 'package:vinansia_lite/widget/sectoral_section_widget.dart';
import 'package:vinansia_lite/widget/snip_section_widget.dart';
import 'package:vinansia_lite/widget/stock_section_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SnipResponseItemDto> snipUiList = [];
  List<UnboxingStockResponseItemDto> stockUiList = [];
  List<UnboxingSectoralResponseItemDto> sectoralUiList = [];

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    var responseSnip = await loadSnipData();
    var responseSectoral = await loadSectoralData();
    var responseStock = await loadStockData();

    responseSnip.data?.forEach((element) {
      snipUiList.add(element);
    });
    responseSectoral.data?.forEach((element) {
      sectoralUiList.add(element);
    });
    responseStock.data?.forEach((element) {
      stockUiList.add(element);
    });

    setState(() {
      snipUiList;
      sectoralUiList;
      stockUiList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.all(18.0),
          child: Image.network(
              "https://vinansia.feylabs.my.id/wp-content/uploads/2023/12/vinansia_icon.png",width: 200,),
        ),
        centerTitle: true, // Center the title
        actions: [
          IconButton(
            icon: Icon(Icons.add), // Your icon goes here
            onPressed: () {
              // Handle icon tap
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectoralSectionWidget(datas: sectoralUiList),
            SnipSectionWidget(datas: snipUiList),
            StockSectionWidget(datas: stockUiList),
          ],
        ),
      ),
    );
  }
}
