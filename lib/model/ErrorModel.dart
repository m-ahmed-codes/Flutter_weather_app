// To parse this JSON data, do
//
//     final error = errorFromJson(jsonString);

import 'dart:convert';

Error errorFromJson(String str) => Error.fromJson(json.decode(str));

String errorToJson(Error data) => json.encode(data.toJson());

class Error {
  ErrorClass? error;

  Error({
    this.error,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        error:
            json["error"] == null ? null : ErrorClass.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error?.toJson(),
      };
}

class ErrorClass {
  int? code;
  String? message;

  ErrorClass({
    this.code,
    this.message,
  });

  factory ErrorClass.fromJson(Map<String, dynamic> json) => ErrorClass(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
