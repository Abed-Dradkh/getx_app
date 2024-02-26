import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/binding/movie_bindings.dart';
import 'package:getx_app/home.dart';
import 'package:getx_app/services/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return GetMaterialApp(
      initialBinding: MovieBindings(),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
