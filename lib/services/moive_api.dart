import 'dart:convert';
import 'package:get/get.dart';
import 'package:getx_app/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieApi extends GetxController with StateMixin<RxList<Movie>> {
  static MovieApi get to => Get.find();
  static String apiKey = '8b32e84f3944490ea342f6d527412f85';

  var movieData = <Movie>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    String dataUrl =
        "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&page=1";
    final response = await http.get(Uri.parse(dataUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['results'];
      movieData.value = result.map((item) => Movie.fromJson(item)).toList();

      isLoading.value = false;

      change(movieData, status: RxStatus.success()); //* to notife it's success
      // update();
    } else {
      Get.snackbar(
        'Error Loading data!',
        'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}',
      );
    }
  }

  String handleImage(String path) {
    return 'https://image.tmdb.org/t/p/w500$path';
  }
}
