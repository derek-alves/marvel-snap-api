import 'package:marvel_snap/infra/factory/usecase/usecase.dart';

void main(List<String> arguments) async {
  var updateCardsDatabase = updateCardsDatabaseUsecaseFactory();
  var updateLocationDatabase = updateLocationDatabaseUsecaseFactory();
  await updateLocationDatabase.call();
  await updateCardsDatabase.call();
  print('aaaaaaaaaaaaaaaaaaaaaaaa');
}
