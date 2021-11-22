import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lollipop/app/data/CustomTheme.dart';
import 'package:lollipop/app/helpers/BoxDecoration.dart';
import 'package:lollipop/app/modules/CloudPos/controllers/cloud_pos_controller.dart';
import 'package:lollipop/app/responsive/responsiveness.dart';

class NavigationBar extends GetView<CloudPosController> {
  @override
  Widget build(BuildContext context) {
    double Height = 58;
    Responsiveness.isDesktop(context) ? Height = MediaQuery.of(context).size.height : 58;
    return Container(
      height: Height,
      child: !Responsiveness.isDesktop(context) ?
      Obx(()=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                width: 20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      buildMenuButtonTablet("CloudPOS", "assets/icons/Icon.svg", 0, ""),
                      buildMenuButtonTablet("Products", "assets/icons/Product.svg", 1, ""),
                      buildMenuButtonTablet("Activities", "assets/icons/Activity.svg", 2, "+3k"),
                      buildMenuButtonTablet("Messages", "assets/icons/Messages.svg", 3, "22"),
                      buildMenuButtonTablet("Orders", "assets/icons/Orders.svg", 4, "3"),
                      buildMenuButtonTablet("Reports", "assets/icons/Reports.svg", 5, ""),
                    ],
                  ),
            ),
            ),
            Container(
              width: 48,
              child: buildMenuButtonTablet("Dashboard", "assets/icons/Dashboard.svg", 6, ""),
            )
          ],
        ),
      )
          :
      Obx(()=> Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    buildMenuButton("CloudPOS", "assets/icons/Icon.svg", 0, ""),
                    buildMenuButton("Products", "assets/icons/Product.svg", 1, ""),
                    buildMenuButton("Activities", "assets/icons/Activity.svg", 2, "+3k"),
                    buildMenuButton("Messages", "assets/icons/Messages.svg", 3, "22"),
                    buildMenuButton("Orders", "assets/icons/Orders.svg", 4, "3"),
                    buildMenuButton("Reports", "assets/icons/Reports.svg", 5, ""),
                  ],
                ),
              )
            ),
            buildMenuButton("Dashboard", "assets/icons/Dashboard.svg", 6, ""),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(String title, String image, int index, String notify){
    // ignore: deprecated_member_use
    if(notify == ""){
      return FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight:Radius.circular(20), )
          ),
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          color:controller.selectedIndex.value == index ? CustomColor.BackgrouIconMenuSelected : CustomColor.BackgrouIconMenu,
          onPressed: (){
            controller.onItemTapped(index);
          },
          child: Container(
            width: 62,
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  image,
                  width: 28,
                  height: 28,
                ),
                SizedBox(height: 4.0,),
                Text(
                  title,style: TextStyle(fontFamily: 'Roboto' , color: Colors.black, fontSize: 12),
                  overflow: TextOverflow.ellipsis,maxLines: 1,
                )
              ],
            ),
          )
      );
    }
    return Stack(
      alignment: Alignment.topRight,
      children: [
        FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight:Radius.circular(20), )
            ),
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            color:controller.selectedIndex.value == index ? CustomColor.BackgrouIconMenuSelected : CustomColor.BackgrouIconMenu,
            onPressed: (){
              controller.onItemTapped(index);
            },
            child: Container(
              width: 62,
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    image,
                    width: 28,
                    height: 28,
                  ),
                  SizedBox(height: 4.0,),
                  Text(
                    title,style: TextStyle(fontFamily: 'Roboto' , color: Colors.black, fontSize: 12),
                    overflow: TextOverflow.ellipsis,maxLines: 1,
                  )
                ],
              ),
            )
        ),
        Container(
          margin: EdgeInsets.only(top: 2.0, right: 4.0),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          decoration: myBoxDecoration(),
          child: Text("${notify}", style: TextStyle(color: Colors.white, fontSize: 10), overflow: TextOverflow.ellipsis,maxLines: 1,),
        ),
      ],
    );
  }
  Widget buildMenuButtonTablet(String title, String image, int index, String notify){
    // ignore: deprecated_member_use
    if(notify == ""){
      return FlatButton(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(5), topLeft:Radius.circular(5), )
          ),
          color:controller.selectedIndex.value == index ? CustomColor.BackgrouIconMenuSelected : CustomColor.BackgrouIconMenu,
          onPressed: (){
            controller.onItemTapped(index);
          },
          child: Container(
            width: 42,
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  image,
                  width: 18,
                  height: 18,
                ),
                SizedBox(height: 4.0,),
                Text(
                  title,style: TextStyle(fontFamily: 'Roboto' , color: Colors.black, fontSize: 8),
                  overflow: TextOverflow.ellipsis,maxLines: 1,
                )
              ],
            ),
          )
      );
    }
    return Stack(
      alignment: Alignment.topRight,
      children: [
        FlatButton(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(5), topLeft:Radius.circular(5), )
            ),
            color:controller.selectedIndex.value == index ? CustomColor.BackgrouIconMenuSelected : CustomColor.BackgrouIconMenu,
            onPressed: (){
              controller.onItemTapped(index);
            },
            child: Container(
              width: 42,
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    image,
                    width: 18,
                    height: 18,
                  ),
                  SizedBox(height: 4.0,),
                  Text(
                    title,style: TextStyle(fontFamily: 'Roboto' , color: Colors.black, fontSize: 8),
                    overflow: TextOverflow.ellipsis,maxLines: 1,
                  )
                ],
              ),
            )
        ),
        Container(
          margin: EdgeInsets.only(right: 8.0),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          decoration: myBoxDecoration(),
          child: Text("${notify}", style: TextStyle(fontSize: 6.0, color: Colors.white), overflow: TextOverflow.ellipsis,maxLines: 1,),
        ),
      ],
    );
  }
}