import 'package:get/get.dart';
import '../features/Home/Controller/Controller.dart';



class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<homeController>(() => homeController(), fenix: true);



  }
}
