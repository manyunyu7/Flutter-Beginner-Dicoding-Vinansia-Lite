import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinansia_lite/data/snip_response_dto.dart';
import 'package:vinansia_lite/widget/snip_item_widget.dart';

class SnipSectionWidget extends StatelessWidget {
  final List<SnipResponseItemDto> datas;

  const SnipSectionWidget({
    super.key,
    required this.datas,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [];

    datas.forEach((element) {
      var widget = SnipItemWidget(element: element);
      listWidget.add(widget);
    });

    return Container(
      height: 1230,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 18),
            child: Text(
              "Market Snip",
              style: GoogleFonts.montserrat()
                  .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...listWidget,
        ],
      ),
    );
  }
}
