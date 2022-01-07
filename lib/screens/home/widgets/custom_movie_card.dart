import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/getx/service/movie_app.dart';
import 'package:movie_app/models/search_results.dart';
import 'package:movie_app/widgets/text/CustomText.dart';

// ignore: must_be_immutable
class CustomMOvieCard extends StatelessWidget {
  final MoviewAppService _service = Get.find<MoviewAppService>();
  final Movie movie;

  CustomMOvieCard({required this.movie});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 170,
        // color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: Column(
          children: [
            Container(
              height: 250,
              padding: EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: FancyShimmerImage(
                  imageUrl: movie.poster!,
                  boxFit: BoxFit.scaleDown,
                ),
              ),
            ),
            // Container(
            //   alignment: Alignment.center,
            //   child: CustomText(
            //     text: movie.title!,
            //     color: Colors.black,
            //     size: 15,
            //   ),
            // )
          ],
        ),
      ),
      onTap: () {
        _service.fetchMovieDetails(movie.imdbID!);
        Get.toNamed("/details", arguments: movie);
      },
    );
  }
}

// test
