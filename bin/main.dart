import 'package:marvel_snap/infra/factory/make_card_database_repository_impl.dart';

void main(List<String> arguments) async {
  var cardDatabaseRepository = makeCardDatabaseRepositoryFactory();
  await cardDatabaseRepository.update();
}
