class ResponsePayLoad {
  String data = "";
  int statusCode = 200;
  bool isSuccessful = true;

  ResponsePayLoad(String data, int statusCode) {
    this.isSuccessful = (statusCode >= 200 && statusCode <= 299);
    this.data = data;
    this.statusCode = statusCode;

    
  }
}
