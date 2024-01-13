import 'package:get/get.dart';
import 'package:graduation_project/helper/local_storage_data.dart';
import 'package:graduation_project/view/registration/auth.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => LocalStorageData());

  }
}