import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinansia_lite/data/snip_response_dto.dart';
import 'package:vinansia_lite/data/unboxing_sectoral_response_dto.dart';
import 'package:vinansia_lite/data/unboxing_stock_response_dto.dart';
import 'package:vinansia_lite/widget/sectoral_item_widget.dart';
import 'package:vinansia_lite/widget/snip_item_widget.dart';
import 'package:vinansia_lite/widget/sectoral_section_widget.dart';
import 'package:vinansia_lite/widget/stock_item_widget.dart';

class StockSectionWidget extends StatelessWidget {
  final List<UnboxingStockResponseItemDto> datas;

  const StockSectionWidget({
    super.key,
    required this.datas,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [];

    datas.forEach((element) {
      var widget = StockItemWidget(element: element);
      listWidget.add(widget);
    });


    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 18),
          child: Text(
            "Market Snip",
            style: GoogleFonts.montserrat()
                .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 320,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            primary: false,
            shrinkWrap: true,
            children: <Widget>[
              ...listWidget,
            ],
          ),
        ),
      ],
    );


  }
}
