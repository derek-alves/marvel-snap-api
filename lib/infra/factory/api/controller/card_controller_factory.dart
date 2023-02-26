import '../../../api/controller/controller.dart';
import '../../usecase/get_cards_usecase_factory.dart';

CardController cardControllerFactory() => CardController(
      getCardsUsecases: getCardsUsecaseFactory(),
    );
