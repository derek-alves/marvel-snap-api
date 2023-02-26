import '../../../domain/infra/database/database.dart';
import '../../database/mongo_connection_adapter.dart';

DatabaseService mongoConnectionFactory() => MongoConnectionAdapter();
