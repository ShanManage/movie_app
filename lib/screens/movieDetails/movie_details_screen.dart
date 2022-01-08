import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/getx/service/movie_app.dart';
import 'package:movie_app/widgets/icons/custom_icon.dart';
import 'package:movie_app/widgets/text/custom_text.dart';

// ignore: must_be_immutable
class MovieDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<MoviewAppService>(
          builder: (controller) {
            return (controller.isLoad.value)
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: FancyShimmerImage(
                                imageUrl: controller.movieDetail.value.poster!,
                                boxFit: BoxFit.scaleDown,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: CustomText(
                                      text: controller.movieDetail.value.title!,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              CustomIcon(
                                                icon: Icons.access_time,
                                                size: 16,
                                                bgColor: Colors.transparent,
                                                color: Colors.white54,
                                              ),
                                              CustomText(
                                                text: controller
                                                    .movieDetail.value.runtime!,
                                                size: 16,
                                                color: Colors.white54,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              CustomIcon(
                                                icon: Icons.star,
                                                size: 18,
                                                bgColor: Colors.transparent,
                                                color: Colors.yellow,
                                              ),
                                              CustomText(
                                                text: controller.movieDetail
                                                        .value.imdbRating! +
                                                    " (IMDB)",
                                                size: 16,
                                                color: Colors.white54,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.5,
                                    color: Colors.white38,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: CustomText(
                                            text: "Release date",
                                            size: 20,
                                          ),
                                        ),
                                        CustomText(
                                          text: controller
                                              .movieDetail.value.released!,
                                          size: 16,
                                          color: Colors.white54,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.5,
                                    color: Colors.white38,
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Row(
                                            children: [
                                              CustomText(
                                                text: "Director",
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              CustomText(
                                                text: controller.movieDetail
                                                    .value.director!,
                                                size: 16,
                                                color: Colors.white54,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: "Writer",
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 48,
                                              ),
                                              Expanded(
                                                child: CustomText(
                                                  text: controller.movieDetail
                                                      .value.writer!,
                                                  size: 16,
                                                  color: Colors.white54,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: CustomText(
                                      text: controller.movieDetail.value.plot!,
                                      size: 16,
                                      color: Colors.white54,
                                      weight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          left: 10,
                          top: 10,
                          child: Container(
                            child: CustomIcon(
                              icon: Icons.arrow_back,
                              callback: () {
                                Get.back();
                              },
                              size: 30,
                              color: Colors.white,
                              bgColor: Colors.grey.withOpacity(0.6),
                              padding: EdgeInsets.all(8),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
