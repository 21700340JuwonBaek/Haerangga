import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = '52.79.142.108',
      user = 'admin',
      password = 'gofkdrk1234',
      db = 'haerang_ga';

  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}
