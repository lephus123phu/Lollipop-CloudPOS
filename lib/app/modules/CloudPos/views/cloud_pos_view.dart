import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lollipop/app/modules/CloudPos/views/tablet_cloud_pos_view.dart';
import 'package:lollipop/app/responsive/responsiveness.dart';

import '../controllers/cloud_pos_controller.dart';
import 'desktop_cloud_pos_view.dart';
import 'mobile_cloud_pos_view.dart';

class CloudPosView extends GetView<CloudPosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsiveness(
        desktop: DesktopCloudPosView(),
        tablet: TabletCloudPosView(),
        mobile: MobileCloudPosView(),
      )
    );
  }
}
