// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../server/api_handler.dart';
import '../controller/controller.dart';

class CardRouter extends ApiHandler {
  late final CardController _cardController;

  CardRouter(CardController cardController) {
    _cardController = cardController;
  }

  @override
  Handler getHandler() {
    var router = Router();
    router.get(
      "/card/list",
      _cardController.getCards,
    );

    return createHandler(handler: router);
  }
}
