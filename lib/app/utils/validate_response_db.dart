List ValidateResponse(String input){
  List res = [];
  input = input.replaceAll('//"', '');
  input = input.replaceAll(";,", ";");
  input = input.replaceAll("\"", "");
  input = input.replaceAll(";,", ";");
  input = input.replaceAll('///"', '');
  input = input.replaceAll('//', '');
  input = input.replaceAll('\\', '');
  input = input.replaceAll("};", "");
  var s = input.split(";");
  for(var element in s){
      String tmp = element+";";
      var data = tmp.split(":");
      res.add(data[data.length-1]);
  }
  return res;
}