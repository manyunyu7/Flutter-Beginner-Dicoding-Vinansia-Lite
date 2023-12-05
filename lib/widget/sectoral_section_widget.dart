import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinansia_lite/data/snip_response_dto.dart';
import 'package:vinansia_lite/data/unboxing_sectoral_response_dto.dart';
import 'package:vinansia_lite/widget/sectoral_item_widget.dart';
import 'package:vinansia_lite/widget/snip_item_widget.dart';
import 'package:vinansia_lite/widget/sectoral_section_widget.dart';

class SectoralSectionWidget extends StatelessWidget {
  final List<UnboxingSectoralResponseItemDto> datas;

  const SectoralSectionWidget({
    super.key,
    required this.datas,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [];

    var filterIds = [206, 205, 34, 203, 4, 202, 199, 204]; // IDs to filter b
    datas.forEach((element) {
      var widget = SectoralItemWidget(element: element);

      //filter certain item to be shown.
      if (filterIds.contains(element.id ?? 0)) listWidget.add(widget);
    });

    return Container(
      height: 230,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ...listWidget,
        ],
      ),
    );
  }
}

