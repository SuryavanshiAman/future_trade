import 'package:flutter/foundation.dart';
import 'package:future_trade/model/note_model.dart';
import 'package:future_trade/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class NoteRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<NoteModel> noteApi() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(ApiUrl.note);
      return NoteModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during noteApi: $e');
      }
      rethrow;
    }
  }
}