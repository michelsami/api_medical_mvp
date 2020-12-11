import 'package:flutter/material.dart';

class LuggageCard extends StatefulWidget {
  String name;
  String brand;
  String category;

  LuggageCard({this.name, this.brand, this.category});

  @override
  _LuggageCardState createState() => _LuggageCardState();
}

class _LuggageCardState extends State<LuggageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          color: Colors.blue.shade300,
        ),
      ),
      // height: MediaQuery.of(context).size.height * 0.16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile main menu
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name : "),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1),
              ),
              Text("Brand :"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1),
              ),
              Text("Category : "),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
          ),
          // Personal info from API
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${widget.name}"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1),
              ),
              Text("${widget.brand}"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1),
              ),
              Text("${widget.category}"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1),
              ),
            ],
          ),
          //
        ],
      ),
    );
  }
}
