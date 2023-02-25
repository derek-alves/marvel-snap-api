import 'package:marvel_snap/domain/infra/repository/database_update_repository.dart';

import '../../repository/repository.dart';
import '../database/mongo_connection_adapter_factory.dart';

DatabaseUpdateRepository locationDatabaseRepositoryFactory() =>
    LocationDatabaseRepositoryImpl(
      connection: mongoConnectionFactory(),
    );
