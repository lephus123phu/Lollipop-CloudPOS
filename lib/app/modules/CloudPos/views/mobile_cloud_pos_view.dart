import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lollipop/app/modules/CloudPos/controllers/cloud_pos_controller.dart';
import 'package:lollipop/app/modules/CloudPos/widgets/BottomShowFunction.dart';
import 'package:lollipop/app/modules/CloudPos/widgets/ContainerBottomShowRightPage.dart';
import 'package:lollipop/app/modules/CloudPos/widgets/FunctionLeftPage.dart';
import 'package:lollipop/app/modules/CloudPos/widgets/NavigationBar.dart';
import 'package:lollipop/app/modules/CloudPos/widgets/TableLeftPage.dart';

class MobileCloudPosView extends GetView<CloudPosController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          children: [
            Obx(()=>
            controller.isViewBottomSheet.value ?
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                      flex: 8,
                      child: TableLeftPage()
                  ),
                  Container(
                    height: 98,
                    child: FunctionLeftPage(),
                  ),
                ],
              ),
            )
                :
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  Expanded(
                      flex: 8,
                      child: TableLeftPage()
                  ),
                  Container(
                    height: 98,
                    child: FunctionLeftPage(),
                  ),
                ],
              ),
            )
            ),

            Obx(()=>
            controller.isViewBottomSheet.value ?
            Expanded(
                flex: 5,
                child:BottomShowFunction()
            )
                :
            Expanded(
              flex: 1,
              child:ContainerBottomShowRightPage(),
            )
            ),
            Expanded(
              flex: 1,
              child: NavigationBar(),
            ),
          ],
      )
    );
  }

}