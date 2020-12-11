import 'package:api_medical_mvp/Models/apiModel.dart';
import 'package:dio/dio.dart';

class ApiData {
  final url = "https://run.mocky.io/v3/";
  final endPoint = "701ff6f4-0181-47fe-9461-473f6d0aec92";

  Future<ApiModel> getApiData() async {
    ApiModel apiModel = ApiModel();
    Response response = await Dio().get("$url$endPoint");

    apiModel = ApiModel.dataFromJason(response.data);
    return apiModel;
  }
}
