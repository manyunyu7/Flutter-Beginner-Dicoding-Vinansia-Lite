import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinansia_lite/data/snip_response_dto.dart';
import 'package:vinansia_lite/data/unboxing_sectoral_response_dto.dart';

class SnipItemWidget extends StatelessWidget {
  const SnipItemWidget({
    super.key,
    required this.element,
  });

  final SnipResponseItemDto element;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 200,
      margin: const EdgeInsets.only(left: 10,right: 10),
      child: Card(
        surfaceTintColor: Colors.white,
        color: const Color(0xFFFFFFFF),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      element.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat().copyWith(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      element.description ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat().copyWith(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Image.network(
                    element.compressedImageUrl ?? "",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
