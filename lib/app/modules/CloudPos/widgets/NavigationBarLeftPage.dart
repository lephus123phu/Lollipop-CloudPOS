import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lollipop/app/data/CustomTheme.dart';
import 'package:lollipop/app/data/testing/ListDataMenuBottomMenuLeft.dart';
import 'package:lollipop/app/modules/CloudPos/controllers/cloud_pos_controller.dart';
import 'package:lollipop/app/responsive/responsiveness.dart';

class NavigationBarLeftPage extends GetView<CloudPosController>{
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.0,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: new List.generate(allMenuBottomLeft.length, (int index) {
            return buildMenuButtonLeft(context ,allMenuBottomLeft[index]);
          }
        )
      )
    );
  }
  Widget buildMenuButtonLeft(BuildContext context ,MenuBottomLeft data){
    if(data.mIcon == ""){
      return FlatButton(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          color:CustomColor.BackgrouIconMenu,
          onPressed: (){showWhenClickDiscount(context);},
          child: Container(
            width: 40,
            child: SingleChildScrollView(
              child:  Column(
                children: <Widget>[
                  Text(
                    '30%',style: TextStyle(fontFamily: 'Roboto' , color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0,),
                  Text(
                    data.Title,style: TextStyle(fontFamily: 'Roboto' , color: Colors.black, fontSize: 10),
                  )
                ],
              ),
            )
          )
      );
    }
    return FlatButton(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        color:CustomColor.BackgrouIconMenu,
        onPressed: (){},
        child: Container(
          width: 40,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  data.mIcon,
                  width: 14,
                  height: 14,
                ),
                SizedBox(height: 4.0,),
                Text(
                  data.Title,style: TextStyle(fontFamily: 'Roboto' , color: Colors.black, fontSize: 12),
                )
              ],
            ),
          )
        )
    );
  }

  void showWhenClickDiscount(BuildContext context){
    double _w =  MediaQuery.of(context).size.width;
    Responsiveness.isDesktop(context) ? _w = _w/2: _w = MediaQuery.of(context).size.width;
    Get.bottomSheet(
        Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: _w
              ),
              child:Container(
                color: Colors.white,
                padding: const EdgeInsets.only(bottom:32 ),
                child: Column(
                  children: [
                    Container(
                      height: 38.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      color: Color(0xFFD9D9D9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Discount"),
                          IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.close))
                        ],
                      ),
                    ),
                    Container(
                      height: 38.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                      width: _w,
                      child: TextField(
                        onChanged: (value){
                        },
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        controller: controller.textEditingDiscount1,
                        decoration: InputDecoration(
                            prefixIcon:  Image.asset('assets/icons/Discount1.png'),
                            suffixIcon: Icon(Icons.clear),
                            hintText: 'Enter your input',
                            hintStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black)
                            )
                        ),
                      ),
                    ),
                    Container(
                      height: 38.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                      width: _w,
                      child: TextField(
                        onChanged: (value){
                        },
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        controller: controller.textEditingDiscount2,
                        decoration: InputDecoration(
                            prefixIcon:  Image.asset('assets/icons/Discount2.png'),
                            suffixIcon: Icon(Icons.clear),
                            hintText: 'Enter your input',
                            hintStyle: TextStyle(fontSize: 13.0, color: Colors.grey),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.black)
                            )
                        ),
                      ),
                    ),
                    Expanded(child: keyboardQuantity(context),),
                  ],
                ),
              ),
            )
        )
    );
  }
  Widget keyboardQuantity(BuildContext context){
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(child:buttonNumberKeyBoard("7"), ),
                    Expanded(child:buttonNumberKeyBoard("8"), ),
                    Expanded(child:buttonNumberKeyBoard("9"), ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: buttonNumberKeyBoard("4"),),
                    Expanded(child: buttonNumberKeyBoard("5"),),
                    Expanded(child: buttonNumberKeyBoard("6"),),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child:buttonNumberKeyBoard("1"),
                    ),
                    Expanded(
                      child:buttonNumberKeyBoard("2"),
                    ),Expanded(
                      child:buttonNumberKeyBoard("3"),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: buttonNumberKeyBoard("0"),
                      ),
                      Expanded(
                        child: buttonNumberKeyBoard("."),
                      ),
                      Expanded(
                        child:Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
                            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0) //                 <--- border radius here
                              ),
                            ),
                            child: TextButton(
                              onPressed: (){},
                              child: Image.asset('assets/icons/delete.png'),
                            )
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
                            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 35.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0) //                 <--- border radius here
                              ),
                            ),
                            child: TextButton(
                              onPressed: (){},
                              child: Image.asset('assets/icons/arrow_top.png'),
                            )
                        ),)
                      ],
                    )
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
                            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 35.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0) //                 <--- border radius here
                              ),
                            ),
                            child: TextButton(
                              onPressed: (){},
                              child:  Image.asset('assets/icons/arrow_bottom.png'),
                            )
                        ),)
                      ],
                    )
                ),
              ],
            )
        )
      ],
    );
  }
  Widget buildButtonVAT(String title, int index){
    Color c =  Colors.black26;
    Color bg = Colors.white;
    Color text = Color(0xff666666);
    if(index == 3){
      c =  Colors.blue;
      text = Colors.blue;
      bg = CustomColor.BackgrouIconMenuSelected;
    }
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: c),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        margin: const EdgeInsets.all(4.0),
        child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            color:bg,
            onPressed: (){
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
  Widget buttonNumberKeyBoard(var s){
    return  Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(
              width: 1.0,
              color: Colors.grey
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(5.0) //                 <--- border radius here
          ),
        ),
        child: TextButton(
          onPressed: (){},
          child: Text("${s}", style: TextStyle(color: Colors.black),),
        )
    );
  }
}