import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lollipop/app/data/testing/data.dart';
import 'package:lollipop/app/modules/CloudPos/controllers/cloud_pos_controller.dart';
import 'package:lollipop/app/responsive/responsiveness.dart';

class GirdCardRightPage extends GetView<CloudPosController>{
  @override
  Widget build(BuildContext context) {
    int _crossAxisCount = 4;
    Responsiveness.isMobile(context) ? _crossAxisCount = 3:_crossAxisCount = 4;
    return Container(
      child: SingleChildScrollView(
        child:  GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: demoRecentFiles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            crossAxisCount: _crossAxisCount,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) => FileToCard(demoRecentFiles[index]),
        ),
      ),
    );
  }
  Widget FileToCard(RecentFile data){
    return Card(
      child: Container(
        alignment: Alignment.center,
        color: data.color,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 4.0),
                child: Text("${data.title}", style: TextStyle(fontFamily: 'Roboto',), textAlign: TextAlign.center,),
              ),
              Container(
                child: Text("${data.number}", style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
              Container(
                padding: const EdgeInsets.all(4.0),
                child: Text("${data.percent}", style: TextStyle(fontFamily: 'Roboto',), textAlign: TextAlign.center,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}