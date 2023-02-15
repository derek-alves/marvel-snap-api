import 'package:marvel_snap/infra/factory/usecase/update_cards_database_usecase_factory.dart';

void main(List<String> arguments) async {
  try {
    var updateCardsDatabse = updateCardsDatabaseUsecaseFactory();
    await updateCardsDatabse.call();
  } catch (e) {
    print(e);
  }
}
