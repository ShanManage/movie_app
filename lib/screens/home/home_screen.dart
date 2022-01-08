import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/getx/service/movie_app.dart';
import 'package:movie_app/screens/home/widgets/custom_form_field.dart';
import 'package:movie_app/screens/home/widgets/custom_movie_card.dart';

class HomeScreen extends StatelessWidget {
  final MoviewAppService _service = Get.find<MoviewAppService>();
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    searchController.text = "Marvel";
    return Scaffold(
      body: Obx(() => (_service.isLoad.value)
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 80),
                            child: NotificationListener<ScrollNotification>(
                              onNotification:
                                  (ScrollNotification notification) {
                                if (notification.metrics.pixels ==
                                    notification.metrics.maxScrollExtent) {
                                  if (_service.isLoadBottom.value) {
                                    return true;
                                  }
                                  _service.loadMore();
                                }
                                return true;
                              },
                              child: GridView.count(
                                crossAxisCount: 2,
                                // shrinkWrap: true,
                                mainAxisSpacing: 18,
                                crossAxisSpacing: 18,
                                childAspectRatio: 0.6,
                                // padding: EdgeInsets.all(12),
                                children: _service.searchResult.value.movies!
                                    .map(
                                      (movie) => CustomMOvieCard(
                                        movie: movie,
                                      ),
                                    )
                                    .toList(),
                              ),
                            )),
                      ),
                      (_service.isLoadBottom.value)
                          ? Container(
                              padding: EdgeInsets.all(15),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Center(
                        child: CustomFormFeild(
                          fieldController: searchController,
                          hintText: "Search",
                          prefixIcon: Icons.search,
                          fillColor: Colors.grey.withOpacity(0.5),
                          callback: () {
                            _handleSearch();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
    );
  }

  void _handleSearch() {
    _service.fetchMovies(searchController.text);
  }
}