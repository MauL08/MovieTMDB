import '../config/network_request_config.dart';

class ProviderClass {
  NetworkRequestConfig networkRequestConfig = NetworkRequestConfig();

    Future<Map<String, dynamic>> requestGetToNetwork(String endPoint) async {
    return await networkRequestConfig.doGet(endPoint);
  }
}
