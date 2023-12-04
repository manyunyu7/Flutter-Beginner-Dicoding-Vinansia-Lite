import 'package:flutter/material.dart';
import 'package:vinansia_lite/helper/generate_data.dart';
import 'package:vinansia_lite/widget/snip_item_widget.dart';
import 'package:vinansia_lite/widget/unboxing_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    loadSnipData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halo Gaes"),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                UnboxingItemWidget(color: Colors.red,),
                UnboxingItemWidget(color: Colors.blue,),
                UnboxingItemWidget(color: Colors.green,),
                UnboxingItemWidget(color: Colors.yellow,),
                UnboxingItemWidget(color: Colors.orange,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
