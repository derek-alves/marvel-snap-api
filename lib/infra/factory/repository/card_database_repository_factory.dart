import '../../../domain/infra/repository/database_update_repository.dart';
import '../../repository/repository.dart';
import '../database/database.dart';

DatabaseUpdateRepository cardDatabaseRepositoryFactory() =>
    CardDatabaseRepositoryImpl(
      connection: mongoConnectionFactory(),
    );
