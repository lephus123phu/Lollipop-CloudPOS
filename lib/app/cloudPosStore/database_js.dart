import 'dart:js';
alert(){
  context.callMethod('alert', ['Hello from Dart!']);
  var db=openDatabase("itemDB","1.0","itemDB",65535);
}