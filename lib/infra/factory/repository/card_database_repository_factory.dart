import 'package:marvel_snap/domain/infra/repository/database_update_repository.dart';
import 'package:marvel_snap/infra/repository/card_database_repository_impl.dart';

import '../database/mongo_connection_adapter_factory.dart';

DatabaseUpdateRepository cardDatabaseRepositoryFactory() =>
    CardDatabaseRepositoryImpl(
      connection: mongoConnectionFactory(),
    );
