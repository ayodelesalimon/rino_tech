class LoginModel {
  String? username;
  String? deviceIdentification;
  String? firebaseMessagingToken;
  String? password;

  LoginModel(
      {this.username,
      this.deviceIdentification,
      this.firebaseMessagingToken,
      this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    deviceIdentification = json['device_identification'];
    firebaseMessagingToken = json['firebase_messaging_token'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['device_identification'] = this.deviceIdentification;
    data['firebase_messaging_token'] = this.firebaseMessagingToken;
    data['password'] = this.password;
    return data;
  }
}