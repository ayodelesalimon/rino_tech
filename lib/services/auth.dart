import 'dart:convert';

import '../config/app_config.dart';
import '../model/login_model.dart';
import '../model/login_response_model.dart';
import 'helpers.dart';
import 'http_instance.dart';

final header = {
  'Content-Type': 'application/json; charset=UTF-8',
  'api-version': '1.0'
};

class Auth {
  static userLogin(LoginModel login) async {
    final url = AppConfig.BASE_URL + 'api/login';
    try {
      print(url);
      final response = await Api.post(url, login);
      Map<String, dynamic> jsonDeCoded = jsonDecode(response.data);

      final res = LoginResponseModel.fromJson(jsonDeCoded);
      print(res.data);

      if (response.statusCode == 200) {
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(jsonDeCoded);
             await setToLocalStorage(name: "token", data: loginResponseModel.data!.token!);
        return loginResponseModel;
      } else {
        return jsonDeCoded;
      }
    } catch (e) {
      throw e;
    }
  }
}
