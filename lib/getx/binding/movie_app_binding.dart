import 'package:get/get.dart';
import 'package:movie_app/getx/service/movie_app_service.dart';

class MovieAppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MoviewAppService>(MoviewAppService());
  }
}
