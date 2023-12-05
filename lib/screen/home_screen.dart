import 'package:flutter/material.dart';
import 'package:vinansia_lite/data/generate_data.dart';
import 'package:vinansia_lite/data/snip_response_dto.dart';
import 'package:vinansia_lite/data/unboxing_sectoral_response_dto.dart';
import 'package:vinansia_lite/widget/sectoral_section_widget.dart';
import 'package:vinansia_lite/widget/snip_section_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SnipResponseItemDto> snipUiList = [];
  List<UnboxingSectoralResponseItemDto> stockUiList = [];
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
      print("$snipUiList");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halo Gaes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectoralSectionWidget(datas: sectoralUiList),
            SnipSectionWidget(datas: snipUiList),
          ],
        ),
      ),
    );
  }
}
