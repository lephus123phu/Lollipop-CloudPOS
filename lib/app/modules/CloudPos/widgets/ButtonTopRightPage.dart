import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lollipop/app/data/CustomTheme.dart';
import 'package:lollipop/app/modules/CloudPos/controllers/cloud_pos_controller.dart';

class BottonTopRightPage extends GetView<CloudPosController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child:Obx(()=> Container(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buildMidButton("Soup", 0),
              buildMidButton("Sushi", 1),
              buildMidButton("Drink", 2),
              buildMidButton("Grill", 3),
            ],
          ),
        ),
      )),
    );
  }
  Widget buildMidButton(String title, int index){
    Color c =  Colors.black26;
    Color bg = Colors.white;
    Color text = Color(0xff666666);
    if(index == controller.selectedMidIndex.value){
      c =  Colors.blue;
      text = Colors.blue;
      bg = CustomColor.BackgrouIconMenuSelected;
    }
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: c),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: const EdgeInsets.all(4.0),
        child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            color:bg,
            onPressed: (){
              controller.selectedMidIndex.value = index;
            },
            child: Container(
                alignment: Alignment.center,
                width: 62,
                child:Text(
                  "${title}",style: TextStyle(fontFamily: 'Roboto' , color: text, fontSize: 12),
                )
            )
        )
    );
  }
}