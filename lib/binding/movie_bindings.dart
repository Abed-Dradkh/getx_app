import 'package:get/get.dart';
import 'package:getx_app/services/moive_api.dart';

class MovieBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<MovieApi>(MovieApi());
  }
}
