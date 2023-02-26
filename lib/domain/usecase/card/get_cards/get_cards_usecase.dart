import '../../../entity/entity.dart';
import '../card.dart';

abstract class GetCardsUsecase {
  Future<List<Card>> call([GetCardsInput? input]);
}
