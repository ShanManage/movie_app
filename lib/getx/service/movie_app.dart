import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie_app/models/HttpResponse.dart';
import 'package:movie_app/models/details.dart';
import 'package:movie_app/models/search_results.dart';
import 'package:movie_app/services/Http_request.dart';

class MoviewAppService extends GetxService {
  RxBool isLoad = false.obs;
  RxBool isError = false.obs;
  RxBool isLoadBottom = false.obs;
  RxString searchStr = "".obs;
  RxInt page = (-1).obs;
  RxInt rest = (-1).obs;

  Rx<Search> searchResult = Search.name().obs;
  Rx<Details> movieDetail = Details.name().obs;

  @override
  void onInit() {
    fetchMovies("Marvel");
    super.onInit();
  }

  void fetchMovies(String value) async {
    isLoad(true);
    String _url = "s=$value&type=movie";
    String response = await HttpRequest(url: _url).getData();
    HttpResponse data = HttpResponse.fromJson(response);
    searchResult.value = Search.fromJson(data.responseData);

    if (searchResult.value.response == "True") {
      searchStr.value = value;
      page.value = 1;
      rest.value = int.parse(searchResult.value.totalResults!) - 10;
    } else {
      isError(true);
    }
    isLoad(false);
  }

  void loadMore() async {
    if (rest.value > 0) {
      isLoadBottom(true);
      String value = searchStr.value;
      page.value = page.value + 1;
      String _url = "s=$value&type=movie&page=${page.value}";
      String response = await HttpRequest(url: _url).getData();
      HttpResponse data = HttpResponse.fromJson(response);

      Search newSearch = Search.fromJson(data.responseData);
      searchResult.value.movies!.addAll(newSearch.movies!);

      isLoadBottom(false);
    }
  }

  void fetchMovieDetails(String imdbID) async {
    isLoad(true);
    String _url = "i=$imdbID";
    String response = await HttpRequest(url: _url).getData();
    HttpResponse data = HttpResponse.fromJson(response);
    movieDetail.value = Details.fromJson(data.responseData);
    isLoad(false);
  }
}
