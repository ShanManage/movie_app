import 'package:dio/dio.dart';
import 'package:movie_app/config/api/api_routes.dart';
import 'package:movie_app/models/http_response.dart';

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
