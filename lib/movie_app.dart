import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx/binding/movie_app_binding.dart';
import 'screens/home/Home_screen.dart';
import 'screens/movieDetails/Movie_details_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      title: "Movie App",
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      getPages: [
        GetPage(
          name: "/home",
          page: () => HomeScreen(),
          binding: MovieAppBinding(),
        ),
        GetPage(
          name: "/details",
          page: () => MovieDetailScreen(),
          binding: MovieAppBinding(),
        )
      ],
    );
  }
}
