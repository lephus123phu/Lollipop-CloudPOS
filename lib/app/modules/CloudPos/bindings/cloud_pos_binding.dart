import 'package:get/get.dart';

import '../controllers/cloud_pos_controller.dart';

class CloudPosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CloudPosController>(
      () => CloudPosController(),
    );
  }
}
