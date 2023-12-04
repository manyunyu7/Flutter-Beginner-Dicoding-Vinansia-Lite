import 'package:flutter/material.dart';

class UnboxingItemWidget extends StatelessWidget {
  const UnboxingItemWidget({super.key, this.color});
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      color: color,
      child: Card(
        elevation: 2,
        child: Container(
          child: Column(

          ),
        ),
      ),
    );
  }
}
