import 'package:marvel_snap/domain/infra/repository/export.dart';
import 'package:marvel_snap/infra/factory/mongo_connection_adapter_factory.dart';
import 'package:marvel_snap/infra/repository/card_repository.dart';

import '../../../domain/entity/entity.dart';

Repository<Card> cardRepositoryFactory() => CardRepository(
      connection: mongoConnectionFactory(),
    );
