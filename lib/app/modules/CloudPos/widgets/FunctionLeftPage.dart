import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lollipop/app/modules/CloudPos/controllers/cloud_pos_controller.dart';
import 'package:lollipop/app/responsive/responsiveness.dart';

import 'NavigationBarLeftPage.dart';

class FunctionLeftPage extends GetView<CloudPosController>{
  @override
  Widget build(BuildContext context) {
    final inputTextField = TextField(
      onChanged: (value){
      },
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: controller.textEditingController,
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.clear),
          hintText: 'Enter your input',
          hintStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.black)
          )
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: inputTextField,
                  ),
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.qr_code)
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child:!Responsiveness.isTablet(context)?
                  Responsiveness.isMobile(context)?
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded( flex: 2,child:_buildDropDown(context)),
                        Expanded(flex: 4,child: NavigationBarLeftPage()),
                      ],
                    ),
                  ):
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                width: 200,
                child: _buildDropDown(context),
              ):Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                children: [
                  Expanded(child:_buildDropDown(context)),
                  Expanded(child: NavigationBarLeftPage()),
                ],
              ),
          )
        ),
      ],
    );
  }
  Widget _buildDropDown(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: (){},
              child: Container(
                height: 36.0,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black87, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Responsiveness.isMobile(context)?
                Row(
                  children: <Widget>[
                    Icon(Icons.arrow_drop_down)
                  ],
                ):
                Row(
                  children: <Widget>[
                    Text('Service', overflow: TextOverflow.ellipsis,),
                    Spacer(),
                    Icon(Icons.arrow_drop_down)
                  ],
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}