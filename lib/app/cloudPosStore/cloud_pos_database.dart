
import 'package:sqflite/sqflite.dart';


class CloudPosDatabase{
  static Database? _database;
  static List? sql;
  static CloudPosDatabase? _alarmDatabase;
  CloudPosDatabase._createInstance();
  factory CloudPosDatabase(sql){
    if (_alarmDatabase == null){
      _alarmDatabase = CloudPosDatabase._createInstance();
    }
    return _alarmDatabase!;
  }

  Future<Database> get database async{
    if(_database == null){
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async{
    var dir = await getDatabasesPath();
    var path = dir + 'gusrix.db';
    var database = openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          for(int i = 0; i<sql!.length; i++){
            await db.execute(sql![i]);
          }
        }
    );
    print("------------ DATABASE IS READY ------------");
    return database;
  }

  Future<void> getMergeDelete() async{
    var db = await this.database;
    var result = await db.query("MergeDelete");
    result.forEach((element) {
      print(element);
    });
  }


  Future<void> insertTestMergeDelete() async{
    var db = await this.database;
    await db.insert("MergeDelete", {"TableId":1, "RowId":"Success"});
   }


  // Future<int> deleteAlarm(int id) async{
  //   var db = await this.database;
  //   var res = await db.delete(tableAlarm, where: '$columnId = ?', whereArgs: [id]);
  //   return res;
  // }

  // Future<int> activeOrUnActiveAlarm(AlarmInfo alarmInfo)async{
  //   var db = await this.database;
  //   int tmp = 0;
  //   if(alarmInfo.isPending == 0){
  //     tmp = 1;
  //   }
  //   var res = await db.rawUpdate('''
  //   UPDATE ${tableAlarm}
  //   SET ${columnPending} = ?
  //   WHERE ${columnId} = ?
  //   ''',
  //       [tmp, alarmInfo.id]);
  //   return res;
  // }
 }