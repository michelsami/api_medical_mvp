import 'package:flutter/material.dart';

class Midecals extends StatefulWidget {
  String name;
  int price;
  List category = List();

  Midecals({this.name, this.price, this.category});

  @override
  _MidecalsState createState() => _MidecalsState();
}

class _MidecalsState extends State<Midecals> {
  String listWithSeperator = "";

  addSep() {
    for (var i = 0; i < widget.category.length; i++) {
      if (i == widget.category.length - 1) {
        listWithSeperator = listWithSeperator + widget.category[i];
      } else {
        listWithSeperator = listWithSeperator + widget.category[i] + " , ";
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addSep();
  }

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Profile main menu
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name : "),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1),
              ),
              Text("Price : "),
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
              Text("${widget.price}"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1),
              ),
              Text("${listWithSeperator}"),
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
