import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage({Key? key}) : super(key: key);
  List<String> names = [
    "red",
    "green",
    "yellow",
    "red",
    "green",
    "yellow",
    "red",
    "green",
    "yellow",
    "red",
    "green",
    "yellow",
    "red",
    "green",
    "yellow",
  ];
  List<Color> colors = [
    Colors.red,
    Colors.greenAccent,
    Colors.yellow,
    Colors.red,
    Colors.greenAccent,
    Colors.yellow,
    Colors.red,
    Colors.greenAccent,
    Colors.yellow,
    Colors.red,
    Colors.greenAccent,
    Colors.yellow,
    Colors.red,
    Colors.greenAccent,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) => cardItem(id: index, name:names[index],color: colors[index]),
        itemCount: 15,),
    );
  }
}

Widget cardItem({required int id, String? name, Color? color}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 20,),
      color: color,
      width: double.infinity,
      height: 80,
      child: Row(
        children: [
          Text(
            '$id',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Text(
            name!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );