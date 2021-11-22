import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lollipop/app/data/CustomTheme.dart';
import 'package:lollipop/app/data/testing/dataTableBoottomShow.dart';
import 'package:lollipop/app/modules/CloudPos/controllers/cloud_pos_controller.dart';
import 'package:lollipop/app/modules/CloudPos/models/data1Model.dart';
import 'package:lollipop/app/responsive/responsiveness.dart';

import 'ButtonTopRightPage.dart';
import 'ContainerBottomShowRightPage.dart';
import 'GirdCardRightPage.dart';

class BottomShowFunction extends GetView<CloudPosController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      color: Colors.white,
      child: Column(
        children: [
          ContainerBottomShowRightPage(),
          Divider(
            color: Colors.grey,
            height: 1,
          ),
          Obx(()=>
            controller.isSelectedBottomSheet.value == 0 ? // IS VIEW CARTS
            Expanded(
              child: Responsiveness.isDesktop(context) ?
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: DataTable2(
                          headingRowColor:
                          MaterialStateColor.resolveWith((states) => Colors.grey),
                          columnSpacing: 6.0,
                          minWidth: 16.0,
                          headingRowHeight: 32,
                          columns: [
                            DataColumn2(
                              label: Text("Service"),
                              size: ColumnSize.S,
                            ),
                            DataColumn2(
                                label: Text("Time"),
                                size: ColumnSize.L
                            ),
                            DataColumn2(
                                label: Text("Total"),
                                size: ColumnSize.S
                            ),
                          ],
                          rows: List.generate(
                            allData1s.length,
                                (index) => recentFileDataRow(allData1s[index], index),
                          ),
                        ),
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: keyboard(context),
                      )
                  ),
                ],
              ):
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: DataTable2(
                          headingRowColor:
                          MaterialStateColor.resolveWith((states) => Colors.grey),
                          columnSpacing: 6.0,
                          minWidth: 16.0,
                          headingRowHeight: 32,
                          columns: [
                            DataColumn2(
                              label: Text("Service"),
                              size: ColumnSize.S,
                            ),
                            DataColumn2(
                                label: Text("Time"),
                                size: ColumnSize.L
                            ),
                            DataColumn2(
                                label: Text("Total"),
                                size: ColumnSize.S
                            ),
                          ],
                          rows: List.generate(
                            allData1s.length,
                                (index) => recentFileDataRow(allData1s[index], index),
                          ),
                        ),
                      )
                  ),
                ],
              )
            ):
            controller.isSelectedBottomSheet.value == 2 ? // IS VIEW KEYBOARD
            Expanded(child:Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      child: keyboard(context),
                    )
                ),
              ],
            )):
            controller.isSelectedBottomSheet.value == 3 ? // IS VIEW CATELOG
            Expanded(
              child: Column(
               children: [
                 BottonTopRightPage(),
                 Expanded(
                     child: GirdCardRightPage()
                 ),
               ],
              )
            ):
            Expanded(
              child: Responsiveness.isDesktop(context)?
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){},
                                      child: Container(
                                          alignment: Alignment.center,
                                          height: 36.0,
                                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.grey, width: 1.0),
                                              borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                          child: Responsiveness.isMobile(context)?
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(Icons.arrow_drop_down)
                                            ],
                                          ):
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      "assets/icons/calen.svg",
                                                      width: 18,
                                                      height: 18,
                                                    ),
                                                    SizedBox(width: 4.0,),
                                                    Text('Current Month', overflow: TextOverflow.ellipsis,),
                                                  ],
                                                ),
                                                Icon(Icons.arrow_drop_down)
                                              ],
                                            ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                          ),
                          _buildDropDown(context, "YYYY/MM/DD"),
                          _buildDropDown(context, "YYYY/MM/DD"),
                        ],
                      )
                  ),
                  Expanded(
                      flex: 5,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: DataTable2(
                          headingRowColor:
                          MaterialStateColor.resolveWith((states) => Colors.grey),
                          headingRowHeight: 32,
                          columnSpacing: 6.0,
                          minWidth: 16.0,
                          columns: [
                            DataColumn2(
                              label: Text("ID"),
                              size: ColumnSize.M,
                            ),
                            DataColumn2(
                              label: Text("Time"),
                              size: ColumnSize.L
                            ),
                            DataColumn2(
                              label: Text("Total"),
                              size: ColumnSize.S
                            ),
                            DataColumn2(
                              label: Text("Service"),
                              size: ColumnSize.S,
                            ),
                          ],
                          rows: List.generate(
                            allData1s.length,
                                (index) => recentFileDataRowReceipts(allData1s[index], index),
                          ),
                        ),
                      )
                  ),
                ],
              ):
              Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 36.0,
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Colors.grey, width: 1.0),
                                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                      child: Responsiveness.isMobile(context)?
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      ):
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/calen.svg",
                                                width: 18,
                                                height: 18,
                                              ),
                                              SizedBox(width: 4.0,),
                                              Text('Current Month', overflow: TextOverflow.ellipsis,),
                                            ],
                                          ),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),),
                          Expanded(child: _buildDropDown(context, "YYYY/MM/DD"),),
                          Expanded(child: _buildDropDown(context, "YYYY/MM/DD"),),

                        ],
                      )
                  ),
                  Expanded(
                      flex: 5,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: DataTable2(
                          headingRowColor:
                          MaterialStateColor.resolveWith((states) => Colors.grey),
                          headingRowHeight: 32,
                          columnSpacing: 6.0,
                          minWidth: 16.0,
                          columns: [
                            DataColumn2(
                              label: Text("ID"),
                              size: ColumnSize.M,
                            ),
                            DataColumn2(
                                label: Text("Time"),
                                size: ColumnSize.L
                            ),
                            DataColumn2(
                                label: Text("Total"),
                                size: ColumnSize.S
                            ),
                            DataColumn2(
                              label: Text("Service"),
                              size: ColumnSize.S,
                            ),
                          ],
                          rows: List.generate(
                            allData1s.length,
                                (index) => recentFileDataRowReceipts(allData1s[index], index),
                          ),
                        ),
                      )
                  ),
                ],
              )
            )
          ),
        ],
      )
    );
  }
  // CARTS
  DataRow recentFileDataRow(Data1Model data1Model,int index) {
    if(index % 2 != 0){
      return DataRow(
        color: MaterialStateProperty.all(Color(0xffD9D9D9)),
        cells: [
          DataCell(Text('${data1Model.Service}',style: TextStyle(fontSize: 14),),),
          DataCell(Text('${data1Model.Time}',style: TextStyle(fontSize: 14),),),
          DataCell(Text('${data1Model.Total}',style: TextStyle(fontSize: 14),),),
        ],
      );
    }
    return DataRow(
      color: MaterialStateProperty.all(Colors.white),
      cells: [
        DataCell(Text('${data1Model.Service}',style: TextStyle(fontSize: 14),),),
        DataCell(Text('${data1Model.Time}',style: TextStyle(fontSize: 14),),),
        DataCell(Text('${data1Model.Total}',style: TextStyle(fontSize: 14),),),
      ],
    );
  }

  Widget keyboard(BuildContext context){
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(child: buttonNumberKeyBoard("0%"),),
                  Expanded(child: buttonNumberKeyBoard("10%"),),
                  Expanded(child: buttonNumberKeyBoard("15%"),),
                ],
              ),
            ),
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
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                          decoration: BoxDecoration(
                            color: CustomColor.BackgrouIconMenuSelected,
                            border: Border.all(
                                width: 1.0,
                                color: Colors.blue
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0) //                 <--- border radius here
                            ),
                          ),
                          child: TextButton(
                            onPressed: (){},
                            child: Text("21%", style: TextStyle(color: Colors.black),),
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
                            child: Image.asset('assets/icons/coin.png'),
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
                              color: Color(0xFF1155CC)
                          ),
                          child: TextButton(
                            onPressed: (){},
                            child:  Text("Enter", style: TextStyle(color: Colors.black),),
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

  //RECEIPTS
  DataRow recentFileDataRowReceipts(Data1Model data1Model,int index) {
    if(index % 2 != 0){
      return DataRow(
        color: MaterialStateProperty.all(Color(0xffD9D9D9)),
        cells: [
          DataCell(Text('${data1Model.ID}',style: TextStyle(fontSize: 14),),),
          DataCell(Text('${data1Model.Time}',style: TextStyle(fontSize: 14),),),
          DataCell(Text('${data1Model.Total}',style: TextStyle(fontSize: 14),),),
          DataCell(Text('${data1Model.Service}',style: TextStyle(fontSize: 14),),),
        ],
      );
    }
    return DataRow(
      color: MaterialStateProperty.all(Colors.white),
      cells: [
        DataCell(Text('${data1Model.ID}',style: TextStyle(fontSize: 14),),),
        DataCell(Text('${data1Model.Time}',style: TextStyle(fontSize: 14),),),
        DataCell(Text('${data1Model.Total}',style: TextStyle(fontSize: 14),),),
        DataCell(Text('${data1Model.Service}',style: TextStyle(fontSize: 14),),),
      ],
    );
  }

  Widget _buildDropDown(BuildContext context, String s) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: (){},
              child: Container(
                alignment: Alignment.center,
                  height: 36.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Responsiveness.isMobile(context)?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.arrow_drop_down)
                    ],
                  ):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('${s}', overflow: TextOverflow.ellipsis,),
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