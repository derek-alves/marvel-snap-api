import '../../../domain/entity/entity.dart';
import '../../../domain/infra/repository/export.dart';
import '../../repository/card_repository.dart';
import '../database/database.dart';

Repository<Card> cardRepositoryFactory() => CardRepository(
      connection: mongoConnectionFactory(),
    );
