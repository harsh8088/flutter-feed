import 'dart:async';
import 'dart:convert';
import 'package:flutter_feed/services/network_service_response.dart';
import 'package:http/http.dart' as http;

class RestClient {
  Map<String, String> headers = {
    "CONTENT_TYPE": 'application/json',
    "ACCEPT": 'application/json',
  };

  Future<MappedNetworkServiceResponse<T>> getAsync<T>(
      String resourcePath) async {
    var response = await http.get(Uri.parse(resourcePath));
    return processResponse<T>(response);
  }

  Future<MappedNetworkServiceResponse<T>> postAsync<T>(
      String resourcePath, dynamic data) async {
    var content = json.encoder.convert(data);
    var response = await http.post(Uri.parse(resourcePath),
        body: content, headers: headers);
    return processResponse<T>(response);
  }

  MappedNetworkServiceResponse<T> processResponse<T>(http.Response response) {
    if (!((response.statusCode < 200) ||
        (response.statusCode >= 300) ||
        (response.body == null))) {
      var jsonResult = response.body;
      dynamic resultClass = jsonDecode(jsonResult);

      return MappedNetworkServiceResponse<T>(
          mappedResult: resultClass,
          networkServiceResponse: NetworkServiceResponse<T>(success: true));
    } else {
      var errorResponse = response.body;
      return MappedNetworkServiceResponse<T>(
          networkServiceResponse: NetworkServiceResponse<T>(
              success: false,
              message: "(${response.statusCode}) ${errorResponse.toString()}"));
    }
  }
}
