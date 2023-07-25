/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myErrorClasdNode = ErrorClasd.fromJson(map);
*/
class Error {
  int? code;
  String? message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class ErrorClasd {
  Error? error;

  ErrorClasd({this.error});

  ErrorClasd.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ? Error?.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error'] = error!.toJson();
    return data;
  }
}
