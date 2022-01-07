import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/config/api/Api_routes.dart';
import 'package:movie_app/models/HttpResponse.dart';
import 'package:movie_app/models/search_results.dart';

class HttpRequest {
  final String url;
  Map<String, dynamic>? data;
  String baseurl = ApiRoutes.API_BASE_URL;
  HttpRequest({
    required this.url,
    this.data,
  });

  Future<String> getData() async {
    Options optionlist = await getOptions();
    // Rx<Search> searchResult = Search.name().obs;

    Response response =
        await Dio().get(baseurl + this.url, options: optionlist);
    // Logger().i(response);
    Logger().i(response.data);
    // Logger().i(response.statusCode);
    // Search searchResult = Search.fromJson(response.data);
    // Logger().i(searchResult.movies);

    // return jsonEncode(response);
    return HttpResponse(
      responseData: response.data,
      responseCode: response.statusCode,
    ).toJson();
  }

  Future<Options> getOptions() async {
    return Options(
      headers: {
        'Accept': 'application/json',
      },
      validateStatus: (status) {
        return status! < 500;
      },
    );
  }
}
