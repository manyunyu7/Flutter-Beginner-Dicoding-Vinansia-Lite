import 'package:flutter/material.dart';
import 'package:vinansia_lite/data/snip_response_dto.dart';
import 'package:vinansia_lite/data/unboxing_sectoral_response_dto.dart';
import 'package:vinansia_lite/widget/unboxing_item_widget.dart';
import 'package:vinansia_lite/widget/snip_item_widget.dart';
import 'package:vinansia_lite/widget/sectoral_section_widget.dart';
import 'package:vinansia_lite/widget/unboxing_item_widget.dart';

class SectoralSectionWidget extends StatelessWidget {
  final List<UnboxingSectoralResponseItemDto> datas;

  const SectoralSectionWidget({
    super.key,
    required this.datas,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [];
    datas.forEach((element) {
      var widget = Container(
        height: 210,
        width: 200,
        child: Card(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(element.title ?? ""),
              Text(element.dateDisplay ?? ""),
              SizedBox(height: 20,),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)), // Adjust the border radius as needed
                  child: Image.network(
                    element.thumbnailUrl ?? "",
                    fit: BoxFit.fill, // Maintain aspect ratio and cover the available space
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      listWidget.add(widget);
    });

    return Container(
      height: 210,
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
