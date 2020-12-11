import 'package:api_medical_mvp/cards/Luggage_card.dart';
import 'package:api_medical_mvp/cards/Midecals_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../cards/Profile_card.dart';

class AllCards extends StatefulWidget {
  @override
  _AllCardsState createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  String name;
  String country;
  String homeCountry;
  List luggage = List();
  List midecals = List();
  bool isLoading = true;

  int age;

  getData() async {
    Response data = await Dio()
        .get("https://run.mocky.io/v3/701ff6f4-0181-47fe-9461-473f6d0aec92");

    name = data.data["name"];
    age = data.data["age"];
    country = data.data["country"];
    homeCountry = data.data["home_country"];

    luggage = data.data["luggage"];
    midecals = data.data["midecals"];
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "We Care",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontFamily: "Raleway"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Profile
                      ProfileCard(
                        name: "$name",
                        age: age,
                        country: "$country",
                        homeCountry: "$homeCountry",
                      ),

                      // padding
                      SizedBox(
                        height: 10,
                      ),
                      // Lugguge title
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Luggage",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Luggage menu
                      ListView.builder(
                        primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: luggage.length,
                        itemBuilder: (context, index) {
                          return LuggageCard(
                            name: luggage[index]["name"],
                            brand: luggage[index]["brand"],
                            category: luggage[index]["category"],
                          );
                        },
                      ),
                      // padding
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Medical",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Midecals menu
                      ListView.builder(
                        primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: midecals.length,
                        itemBuilder: (context, index) {
                          return Midecals(
                            name: midecals[index]["name"],
                            price: midecals[index]["price"],
                            category: midecals[index]["category"],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
