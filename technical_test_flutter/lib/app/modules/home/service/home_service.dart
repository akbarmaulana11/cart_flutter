import 'package:dio/dio.dart';
import 'package:technical_test_flutter/app/modules/home/models/home_model.dart';

class HomeService {
  static Future getData() async {
    final dio = Dio();
    final response =
        await dio.get('https://recruitment.pt-bks.com/test/products');
    print(response.data);
    return HomeAllData.fromJson(response.data);
  }
}
