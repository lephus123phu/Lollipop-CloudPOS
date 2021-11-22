import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloudPosController extends GetxController {
  TextEditingController textEditingController = new TextEditingController();
  TextEditingController textEditingQuantity = new TextEditingController();
  TextEditingController textEditingDiscount1 = new TextEditingController();
  TextEditingController textEditingDiscount2 = new TextEditingController();
  var selectedIndex = 0.obs;
  var isViewBottomSheet = false.obs;
  var selectedMidIndex = 0.obs;
  var isSelectedBottomSheet = 0.obs; // 0:Carts  1:Receipts  2:Keypad  3:Catalog

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    textEditingController.text = "1234567890";
    textEditingQuantity.text = "1.234,5";
    textEditingDiscount1.text = "30,-";
    textEditingDiscount2.text = "1.234,5";
    super.onInit();
  }

  @override
  void onReady() {
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
}
