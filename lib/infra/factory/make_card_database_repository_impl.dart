import 'package:marvel_snap/domain/infra/repository/database_update_repository.dart';
import 'package:marvel_snap/infra/factory/factory.dart';
import 'package:marvel_snap/infra/repository/card_database_repository_impl.dart';

DatabaseUpdateRepository makeCardDatabaseRepositoryFactory() =>
    CardDatabaseRepositoryImpl(
      connection: makeMongoConnectionFactory(),
    );
