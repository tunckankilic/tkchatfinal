import 'package:get/get.dart';
import 'package:tkchatfinal/ui/screens/welcome/controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
