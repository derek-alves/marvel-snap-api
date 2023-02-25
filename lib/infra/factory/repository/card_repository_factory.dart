import 'package:marvel_snap/domain/infra/repository/export.dart';
import 'package:marvel_snap/infra/repository/card_repository.dart';

import '../../../domain/entity/entity.dart';
import '../database/mongo_connection_adapter_factory.dart';

Repository<Card> cardRepositoryFactory() => CardRepository(
      connection: mongoConnectionFactory(),
    );
