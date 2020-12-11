import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  String name;
  String country;
  String homeCountry;
  int age;

  ProfileCard({this.name, this.country, this.homeCountry, this.age});

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile main menu
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
              ),
              Text("age"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
              ),
              Text("Country"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
              ),
              Text("Home Country"),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          // Personal info from API
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${widget.name}"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
              ),
              Text("${widget.age}"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
              ),
              Text("${widget.country}"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
              ),
              Text("${widget.homeCountry}"),
            ],
          ),
          // Profile Avatar
          Expanded(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/1.jpg"),
            ),
          )
        ],
      ),
    );
  }
}
