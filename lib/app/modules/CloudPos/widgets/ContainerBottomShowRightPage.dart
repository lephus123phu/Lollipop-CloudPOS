import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lollipop/app/data/CustomTheme.dart';
import 'package:lollipop/app/modules/CloudPos/controllers/cloud_pos_controller.dart';
import 'package:lollipop/app/responsive/responsiveness.dart';

class ContainerBottomShowRightPage extends GetView<CloudPosController>{
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 38,
        alignment: Alignment.topRight,
        child:
        !Responsiveness.isDesktop(context) ?
        ShowDataIsTabletAndMobile(context) :
        ShowDataIsDesktop(context)
    );
  }

  Widget ShowDataIsTabletAndMobile(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Container(
              width: 20,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    child:Obx(()=> FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft:Radius.circular(10), )
                            ),
                            color: controller.isSelectedBottomSheet.value == 2 ?
                            CustomColor.BackgrouIconMenuSelected : Colors.white,
                            onPressed: (){
                              controller.isSelectedBottomSheet.value = 2;
                            },
                            child: Container(
                                alignment: Alignment.center,
                                child:controller.isSelectedBottomSheet.value == 2 ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/Keypad.svg",
                                      width: 12,
                                      height: 12,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 2.0,),
                                    Text("Keypad",style: TextStyle(color: Colors.blue),)
                                  ],
                                ):Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/Keypad.svg",
                                      width: 12,
                                      height: 12,
                                    ),
                                    SizedBox(width: 2.0,),
                                    Text("Keypad",)
                                  ],
                                )
                            )
                        ),)
                  ),
                  Container(
                    child:Obx(()=>FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft:Radius.circular(10), )
                        ),
                        color: controller.isSelectedBottomSheet.value == 3 ?
                        CustomColor.BackgrouIconMenuSelected : Colors.white,
                        onPressed: (){
                          controller.isSelectedBottomSheet.value = 3;
                        },
                        child: Container(
                            alignment: Alignment.center,
                            child:controller.isSelectedBottomSheet.value == 3 ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Catalog.svg",
                                  width: 12,
                                  height: 12,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 2.0,),
                                Text("Catalog", style: TextStyle(color: Colors.blue),)
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Catalog.svg",
                                  width: 12,
                                  height: 12,
                                ),
                                SizedBox(width: 2.0,),
                                Text("Catalog",)
                              ],
                            )
                        )
                    ),)
                  ),
                  Container(
                    child:Obx(()=>FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft:Radius.circular(10), )
                        ),
                        color: controller.isSelectedBottomSheet.value == 0 ?
                        CustomColor.BackgrouIconMenuSelected : Colors.white,
                        onPressed: (){
                          controller.isSelectedBottomSheet.value = 0;
                        },
                        child: Container(
                            alignment: Alignment.center,
                            child:controller.isSelectedBottomSheet.value == 0 ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Orders.svg",
                                  width: 16,
                                  height: 16,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 2.0,),
                                Text("Carts", style: TextStyle(color: Colors.blue),)
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Orders.svg",
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(width: 2.0,),
                                Text("Carts")
                              ],
                            )
                        )

                    ),)
                  ),
                  Container(
                    child: Obx(()=>FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft:Radius.circular(10), )
                        ),
                        color: controller.isSelectedBottomSheet.value == 1 ?
                        CustomColor.BackgrouIconMenuSelected : Colors.white,
                        onPressed: (){
                          controller.isSelectedBottomSheet.value = 1;
                        },
                        child: Container(
                            alignment: Alignment.center,
                            child:controller.isSelectedBottomSheet.value == 1 ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Receipts.svg",
                                  width: 16,
                                  height: 16,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 2.0,),
                                Text("Receipts",style: TextStyle(color: Colors.blue),)
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Receipts.svg",
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(width: 2.0,),
                                Text("Receipts")
                              ],
                            )
                        )
                    )),
                  ),
                ],
              ),
            )
        ),
        Container(
          child: Obx(()=>
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft:Radius.circular(10), )
                  ),
                  color:Color(0xffD9D9D9),
                  onPressed: (){
                    if(controller.isViewBottomSheet.value){
                      controller.isViewBottomSheet.value = false;
                      // ACTION SHOW CONTAINER BOTTOM
                    }else{
                      controller.isViewBottomSheet.value = true;
                      Get.back();
                    }
                  },
                  child: Container(
                      width: 62,
                      child:controller.isViewBottomSheet.value == false ? Row(
                        children: [
                          Icon(Icons.arrow_drop_up_sharp),
                          SizedBox(width: 2.0,),
                          Text("Show")
                        ],
                      ):Row(
                        children: [
                          Icon(Icons.arrow_drop_down_sharp),
                          SizedBox(width: 2.0,),
                          Text("Hide")
                        ],
                      )
                  )
              )
          ),
        )
      ],
    );
  }

  Widget ShowDataIsDesktop(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              child:
              Obx(()=>FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft:Radius.circular(10), )
                  ),
                  color: controller.isSelectedBottomSheet.value == 0 ?
                    CustomColor.BackgrouIconMenuSelected : Colors.white,
                  onPressed: (){
                    controller.isSelectedBottomSheet.value = 0;
                  },
                  child:Container(
                      width: 80,
                      alignment: Alignment.center,
                      child:controller.isSelectedBottomSheet.value == 0 ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Orders.svg",
                            width: 16,
                            height: 16,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 2.0,),
                          Text("Carts", style: TextStyle(color: Colors.blue),)
                        ],
                      ):Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Orders.svg",
                            width: 16,
                            height: 16,
                          ),
                          SizedBox(width: 2.0,),
                          Text("Carts",)
                        ],
                      )
                  ))
              ),
            ),
            Container(
              child: Obx(()=>
                  FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft:Radius.circular(10), )
                      ),
                      color:controller.isSelectedBottomSheet.value == 1 ?
                      CustomColor.BackgrouIconMenuSelected : Colors.white,
                      onPressed: (){
                        controller.isSelectedBottomSheet.value = 1;
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          child:controller.isSelectedBottomSheet.value == 1 ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Receipts.svg",
                                width: 16,
                                height: 16,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 2.0,),
                              Text("Receipts", style: TextStyle(color: Colors.blue),)
                            ],
                          ):Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Receipts.svg",
                                width: 16,
                                height: 16,
                              ),
                              SizedBox(width: 2.0,),
                              Text("Receipts")
                            ],
                          )
                      )
                  )
              ),
            ),
          ],
        ),
        Container(
          child: Obx(()=>
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft:Radius.circular(10), )
                  ),
                  color:Color(0xffD9D9D9),
                  onPressed: (){
                    if(controller.isViewBottomSheet.value){
                      controller.isViewBottomSheet.value = false;
                      // ACTION SHOW CONTAINER BOTTOM
                    }else{
                      controller.isViewBottomSheet.value = true;
                      Get.back();
                    }
                  },
                  child: Container(
                      width: 62,
                      child:controller.isViewBottomSheet.value == false ? Row(
                        children: [
                          Icon(Icons.arrow_drop_up_sharp),
                          SizedBox(width: 2.0,),
                          Text("Show")
                        ],
                      ):Row(
                        children: [
                          Icon(Icons.arrow_drop_down_sharp),
                          SizedBox(width: 2.0,),
                          Text("Hide")
                        ],
                      )
                  )
              )
          ),
        )
      ],
    );
  }
}