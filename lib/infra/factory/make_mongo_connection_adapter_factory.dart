import 'package:marvel_snap/domain/infra/database/database.dart';
import 'package:marvel_snap/infra/database/mongo_connection_adapter.dart';

DatabaseConnection makeMongoConnectionFactory() => MongoConnectionAdapter();
