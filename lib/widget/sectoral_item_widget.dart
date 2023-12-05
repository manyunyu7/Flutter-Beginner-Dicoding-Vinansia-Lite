import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinansia_lite/data/unboxing_sectoral_response_dto.dart';

class SectoralItemWidget extends StatelessWidget {
  const SectoralItemWidget({
    super.key, required this.element,
  });
  
  final UnboxingSectoralResponseItemDto element;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 200,
      child: Card(
        color: Color(0xFFFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                element.title ?? "",
                style: GoogleFonts.montserrat().copyWith(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(element.dateDisplay ?? ""),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                // Adjust the border radius as needed
                child: Image.network(
                  element.thumbnailUrl ?? "",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
