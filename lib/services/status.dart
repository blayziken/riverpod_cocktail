class Success {
  int? code;
  Map data; // Response Type From API
  Success({required this.code, required this.data});
}

class Failure {
  int? code;
  Map errorResponse;
  Failure({required this.code, required this.errorResponse});
}

class ResponseModel<T> {
  int? code;
  T? data;
  ResponseModel({this.code, this.data});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel<T>(
      code: json['code'],
      data: json['data'],
    );
  }
}
