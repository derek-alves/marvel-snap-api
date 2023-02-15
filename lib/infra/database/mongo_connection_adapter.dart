import 'package:mongo_dart/mongo_dart.dart';

import '../../domain/infra/infra.dart';
import '../env/env.dart';

class MongoConnectionAdapter implements DatabaseConnection<Db> {
  Db? _connection;
  @override
  Future<Db> get connection async {
    _connection ??= await createConnection();
    if (_connection == null) {
      throw Exception("[ERROR/DB] -> Failed Create Connection");
    }
    return _connection!;
  }

  @override
  Future<Db> createConnection([String? mongoConnection]) async {
    try {
      var user = await CustomEnv.get<String>(key: 'mongo_user');
      var password = await CustomEnv.get<String>(key: 'mongo_password');
      var cluster = await CustomEnv.get<String>(key: 'mongo_cluster_name');
      var db = await Db.create(
        mongoConnection ??
            'mongodb+srv://$user:$password@$cluster.pevjfax.mongodb.net/marvel_snap_db?retryWrites=true&w=majority',
      );
      return await db.open();
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
