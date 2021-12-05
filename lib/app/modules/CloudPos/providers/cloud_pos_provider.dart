import 'package:get/get.dart';
import 'package:lollipop/app/service/connect_server.dart';
class CloudPosProvider extends GetConnect {
  Future<Response<dynamic>> GetSqlCreateDatabase(var id)async{
    try {
    final header = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    };
    return await get('${ConnectServer.BaseUrl}${ConnectServer.CreateDatabase}$id', headers: header);
    }catch(exception){
    return await Future.error(exception.toString());
    }
  }
}
