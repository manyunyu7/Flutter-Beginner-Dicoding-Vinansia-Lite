import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinansia_lite/data/unboxing_sectoral_response_dto.dart';
import 'package:vinansia_lite/data/unboxing_stock_response_dto.dart';

class StockItemWidget extends StatelessWidget {
  const StockItemWidget({
    super.key,
    required this.element,
  });

  final UnboxingStockResponseItemDto element;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20,right: 10,left: 10),
      width: 300,
      child: Card(
        surfaceTintColor: Colors.white,
        color: const Color(0xFFFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 130,
              margin: EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                // Adjust the border radius as needed
                child: Image.network(
                  element.thumbnailUrl ?? "",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                element.title ?? "",
                style: GoogleFonts.montserrat().copyWith(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                element.description ?? "",
                maxLines: 3,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
