import 'package:marvel_snap/domain/infra/infra.dart';
import 'package:marvel_snap/infra/database/database.dart';
import 'package:marvel_snap/infra/http/dio_adapter.dart';

import 'di.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    di.register<DatabaseService>(() => MongoConnectionAdapter());
    di.register<HttpService>(() => DioAdapter());
    return di;
  }
}
