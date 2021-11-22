import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lollipop/app/modules/CloudPos/controllers/cloud_pos_controller.dart';
import 'package:lollipop/app/modules/CloudPos/widgets/BottomShowFunction.dart';
import 'package:lollipop/app/modules/CloudPos/widgets/ButtonTopRightPage.dart';
import 'package:lollipop/app/modules/CloudPos/widgets/ContainerBottomShowRightPage.dart';
import 'package:lollipop/app/modules/CloudPos/widgets/FunctionLeftPage.dart';
import 'package:lollipop/app/modules/CloudPos/widgets/GirdCardRightPage.dart';
import 'package:lollipop/app/modules/CloudPos/widgets/NavigationBar.dart';
import 'package:lollipop/app/modules/CloudPos/widgets/NavigationBarLeftPage.dart';
import 'package:lollipop/app/modules/CloudPos/widgets/TableLeftPage.dart';

class DesktopCloudPosView extends GetView<CloudPosController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                    flex: 8,
                    child: TableLeftPage()
                ),
                Expanded(
                  flex: 2,
                  child:FunctionLeftPage(),
                ),
                Expanded(
                    flex: 1,
                    child: NavigationBarLeftPage()
                ),
              ],
            ),
          ),
          Expanded(
              flex: 10,
              child: Column(
                children: [
                  BottonTopRightPage(),
                  Expanded(
                      child: GirdCardRightPage()
                  ),
                  Obx(()=>
                  controller.isViewBottomSheet.value ?
                  BottomShowFunction():
                  ContainerBottomShowRightPage(),
                  )
                ],
              )
          ),
          Expanded(
            flex: 1,
            child: NavigationBar(),
          )
        ],
      )
    );
  }

}