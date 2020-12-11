import 'package:api_medical_mvp/Models/apiModel.dart';
import 'package:api_medical_mvp/cards/Luggage_card.dart';
import 'package:api_medical_mvp/cards/Midecals_card.dart';
import 'package:api_medical_mvp/services/API_data.dart';

import 'package:flutter/material.dart';

import '../cards/Profile_card.dart';

class AllCards extends StatefulWidget {
  @override
  _AllCardsState createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  ApiModel apiModel = ApiModel();
  bool isLoading = true;

  getData() async {
    apiModel = await ApiData().getApiData();

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
                        name: "${apiModel.name}",
                        age: apiModel.age,
                        country: "${apiModel.country}",
                        homeCountry: "${apiModel.home_country}",
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
                        itemCount: apiModel.luggage.length,
                        itemBuilder: (context, index) {
                          return LuggageCard(
                            name: apiModel.luggage[index]["name"],
                            brand: apiModel.luggage[index]["brand"],
                            category: apiModel.luggage[index]["category"],
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
                        itemCount: apiModel.midecals.length,
                        itemBuilder: (context, index) {
                          return Midecals(
                            name: apiModel.midecals[index]["name"],
                            price: apiModel.midecals[index]["price"],
                            category: apiModel.midecals[index]["category"],
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
