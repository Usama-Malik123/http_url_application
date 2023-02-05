import 'package:dio/dio.dart';
import 'url_base_service.dart';

class UrlService {
  BaseService service = BaseService();
  Future<Response> getdata(String text) async {
    try {
      Response response =
          await service.request("www.boredapi.com/api/activity", method: "Get");
      print(" random activity : ${response}");
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}