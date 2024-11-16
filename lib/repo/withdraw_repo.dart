import 'package:flutter/foundation.dart';
import 'package:future_trade/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class WithdrawRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> withdrawApi(dynamic userid,dynamic amount,dynamic password,dynamic type) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse("${ApiUrl.withdrawal}$userid&amount=$amount&password=$password&type=$type");
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during withdrawApi: $e');
      }
      rethrow;
    }
  }
}