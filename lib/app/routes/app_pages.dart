import 'package:get/get.dart';

import 'package:lollipop/app/modules/CloudPos/bindings/cloud_pos_binding.dart';
import 'package:lollipop/app/modules/CloudPos/views/cloud_pos_view.dart';
import 'package:lollipop/app/modules/home/bindings/home_binding.dart';
import 'package:lollipop/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CLOUD_POS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CLOUD_POS,
      page: () => CloudPosView(),
      binding: CloudPosBinding(),
    ),
  ];
}
