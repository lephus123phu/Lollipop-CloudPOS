import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lollipop/app/data/CustomTheme.dart';
import 'package:lollipop/app/data/testing/dataUser.dart';
import 'package:lollipop/app/modules/CloudPos/controllers/cloud_pos_controller.dart';
import 'package:lollipop/app/modules/CloudPos/models/UserModel.dart';
import 'package:lollipop/app/responsive/responsiveness.dart';

class TableLeftPage extends GetView<CloudPosController>{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DataTable2(
            headingRowColor:
            MaterialStateColor.resolveWith((states) => Colors.grey),
            headingRowHeight: 32,
            columnSpacing: 6.0,
            columns: [
              DataColumn2(
                label: Text("Name"),
                size: ColumnSize.L,
              ),
              DataColumn2(
                  label: Text("VAT"),
                  size: ColumnSize.S
              ),
              DataColumn2(
                  label: Text("Qty."),
                  size: ColumnSize.S
              ),
              DataColumn2(
                  label: Text("Value"),
                  size: ColumnSize.S
              ),
            ],
            rows: List.generate(
              allUsers.length,
                  (index) => recentFileDataRow(allUsers[index], index, context),
            ),
          ),
        ),
        Container(
          height: 28,
            color: Colors.grey,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("123.456.789,-",style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            )
        ),
      ],
    );
  }
  DataRow recentFileDataRow(User userInfo,int index, BuildContext context) {
    if(index % 2 != 0){
      return DataRow(
        color: MaterialStateProperty.all(Color(0xffD9D9D9)),
        cells: [
          DataCell(Text('${userInfo.Name}',style: TextStyle(fontSize: 14),),),
          DataCell(TextButton(
            onPressed: (){ShowWhenClickVAT(context);},
            child: Text('${userInfo.VAT}',style: TextStyle(fontSize: 14, color: Colors.black, decoration: TextDecoration.underline,),),
          )),
          DataCell(TextButton(
            onPressed: (){showWhenClickQty(context);},
            child: Text('${userInfo.Qty}',style: TextStyle(fontSize: 14, color: Colors.black, decoration: TextDecoration.underline,),),
          )),
          DataCell(Text('${userInfo.Value}',style: TextStyle(fontSize: 14),),),
        ],
      );
    }
    return DataRow(
      color: MaterialStateProperty.all(Colors.white),
      cells: [
        DataCell(Text('${userInfo.Name}',style: TextStyle(fontSize: 14),),),
        DataCell(TextButton(
          onPressed: (){ShowWhenClickVAT(context);},
          child: Text('${userInfo.VAT}',style: TextStyle(fontSize: 14, color: Colors.black, decoration: TextDecoration.underline,),),
        )),
        DataCell(TextButton(
          onPressed: (){showWhenClickQty(context);},
          child: Text('${userInfo.Qty}',style: TextStyle(fontSize: 14, color: Colors.black, decoration: TextDecoration.underline,),),
        )),
        DataCell(Text('${userInfo.Value}',style: TextStyle(fontSize: 14),),),
      ],
    );
  }
  void ShowWhenClickVAT(BuildContext context){
    double _w =  MediaQuery.of(context).size.width;
    Responsiveness.isDesktop(context) ? _w = _w/2: _w = MediaQuery.of(context).size.width;
    Get.bottomSheet(
      Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: _w
          ),
          child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(bottom:200 ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 48.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      color: Color(0xFFD9D9D9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("VAT Select"),
                          IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.close))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(child: buildButtonVAT("0%", 0)),
                        Expanded(child: buildButtonVAT("10%",1)),
                        Expanded(child: buildButtonVAT("15%",2)),
                        Expanded(child: buildButtonVAT("21%",3))
                      ],
                    )
                  ],
                ),
              )
          ),
        )
      )
    );
  }
  void showWhenClickQty(BuildContext context){
    double _w = MediaQuery.of(context).size.width;
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
                      height: 48.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      color: Color(0xFFD9D9D9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Quantity"),
                          IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.close))
                        ],
                      ),
                    ),
                    Container(
                      height: 48.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      width: _w,
                      child: TextField(
                        onChanged: (value){
                        },
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        controller: controller.textEditingQuantity,
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
          color: bg,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        margin: const EdgeInsets.all(4.0),
        child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
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