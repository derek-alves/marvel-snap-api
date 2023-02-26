import '../../domain/infra/infra.dart';
import '../database/database.dart';
import '../http/dio_adapter.dart';
import 'di.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    di.register<DatabaseService>(() => MongoConnectionAdapter());
    di.register<HttpService>(() => DioAdapter());
    return di;
  }
}
