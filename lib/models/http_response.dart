import 'dart:convert';

class HttpResponse {
  final int? responseCode;
  final Map<String, dynamic> responseData;
  HttpResponse({
    this.responseCode,
    required this.responseData,
  });

  Map<String, dynamic> toMap() {
    return {
      'statusCode': responseCode,
      'data': responseData,
    };
  }

  factory HttpResponse.fromMap(Map<String, dynamic> map) {
    return HttpResponse(
      responseCode: map['statusCode'],
      responseData: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HttpResponse.fromJson(String source) {
    return HttpResponse.fromMap(json.decode(source));
  }
}
