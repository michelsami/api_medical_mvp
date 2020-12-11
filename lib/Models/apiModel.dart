class ApiModel {
  String name;
  int age;
  String country;
  String home_country;
  List luggage;
  List midecals;

  ApiModel(
      {this.name,
      this.age,
      this.country,
      this.home_country,
      this.luggage,
      this.midecals});

  factory ApiModel.dataFromJason(Map DataToParse) {
    return ApiModel(
      name: DataToParse["name"],
      age: DataToParse["age"],
      country: DataToParse["country"],
      home_country: DataToParse["home_country"],
      luggage: DataToParse["luggage"],
      midecals: DataToParse["midecals"],
    );
  }
}
