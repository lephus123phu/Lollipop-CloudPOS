import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lollipop/app/cloudPosStore/cloud_pos_database.dart';
import 'package:lollipop/app/modules/CloudPos/providers/cloud_pos_provider.dart';
import 'package:lollipop/app/utils/validate_response_db.dart';
import 'package:platform_device_id/platform_device_id.dart';

class CloudPosController extends GetxController {
  late CloudPosDatabase _cloudPosDatabase;
  TextEditingController textEditingController = new TextEditingController();
  TextEditingController textEditingQuantity = new TextEditingController();
  TextEditingController textEditingDiscount1 = new TextEditingController();
  TextEditingController textEditingDiscount2 = new TextEditingController();
  var selectedIndex = 0.obs;
  var isViewBottomSheet = false.obs;
  var selectedMidIndex = 0.obs;
  var isSelectedBottomSheet = 0.obs; // 0:Carts  1:Receipts  2:Keypad  3:Catalog
  var deviceUUID = "";




  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() async{
    textEditingController.text = "1234567890";
    textEditingQuantity.text = "1.234,5";
    textEditingDiscount1.text = "30,-";
    textEditingDiscount2.text = "1.234,5";
    deviceUUID = (await PlatformDeviceId.getDeviceId)!;
    print("deviceUUID: ${deviceUUID}");
    super.onInit();
  }

  @override
  void onReady() async{
    List sql = await GetSqlCreateDatabase();
    _cloudPosDatabase = new CloudPosDatabase(sql);
    await _cloudPosDatabase.initializeDatabase();
    //await _cloudPosDatabase.insertTestMergeDelete();
    await _cloudPosDatabase.getMergeDelete();
    super.onReady();
  }

  @override
  void onClose() {}

  @override
  void dispose() {
    textEditingController.dispose();
    textEditingQuantity.dispose();
    textEditingDiscount1.dispose();
    textEditingDiscount2.dispose();

    super.dispose();
  }


  Future<List> GetSqlCreateDatabase()async => CloudPosProvider().GetSqlCreateDatabase("99A4D301-53F5-11CB-8CA0-9CA39A9E1F01").then((resp) {
    return ValidateResponse(resp.body['result']);
  });


    showSnackBarSuccess(String title, String message) {
      Get.snackbar(title, message, backgroundColor: Colors.grey[200],
          snackPosition: SnackPosition.TOP,
          colorText: Colors.green);
    }
    showSnackBarError(String title, String message) {
      Get.snackbar(title, message, backgroundColor: Colors.grey[200],
          snackPosition: SnackPosition.TOP,
          colorText: Colors.red);
    }
}
