import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../config/app_config.dart';
import '../model/response_model.dart';
import 'auth.dart';

final baseUrl = AppConfig.BASE_URL;

class Api {
  static Future<ResponsePayLoad> get({String? endPoint}) async {
    Uri apiUrl = Uri.parse(baseUrl + endPoint!);
    try {
      Future<Response> apiResponse = http.get(
        apiUrl,
        headers: {},
      );
      Response response = await apiResponse;

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        //printData("getit", json.decode(response.body));
        return new ResponsePayLoad(response.body, response.statusCode);
      } else {
        Map<String, dynamic> jsonDeCoded = jsonDecode(response.body);
        final res = jsonDeCoded['message'];

        return new ResponsePayLoad(res, response.statusCode);
      }
    } on SocketException catch (_) {
      throw 'Kindly, check your internet connection.';
    } on TimeoutException catch (_) {
      throw 'Request Timeout.';
    } on FormatException catch (_) {
      throw 'Error Occured.';
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<ResponsePayLoad> post(String? endPoint, body) async {
    Uri apiUrl = Uri.parse(endPoint!);
    try {
      Future<Response> apiResponse =
          http.post(apiUrl,  headers: {...header, 'Authorization': ""},body: jsonEncode(body));
      Response response = await apiResponse;

      if (response.statusCode == 200) {
        print(response.body);
        return new ResponsePayLoad(response.body, response.statusCode);
      } else {
        Map<String, dynamic> jsonDeCoded = jsonDecode(response.body);

        final res = jsonDeCoded['message'];

        return new ResponsePayLoad(res, response.statusCode);
      }
      //return response.body; 1070
    } on SocketException catch (_) {
      throw 'Kindly, check your internet connection.';
    } on TimeoutException catch (_) {
      throw 'Request Timeout.';
    } on FormatException catch (_) {
      throw 'Error Occured.';
    } catch (e) {
      throw e.toString();
    }
  }
}
