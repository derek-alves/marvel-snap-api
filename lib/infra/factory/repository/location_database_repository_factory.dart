import '../../../domain/infra/infra.dart';
import '../../repository/repository.dart';
import '../database/database.dart';

DatabaseUpdateRepository locationDatabaseRepositoryFactory() =>
    LocationDatabaseRepositoryImpl(
      connection: mongoConnectionFactory(),
    );
