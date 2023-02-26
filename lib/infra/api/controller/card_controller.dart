// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shelf/shelf.dart';

import '../../../domain/usecase/card/card.dart';

class CardController {
  late final GetCardsUsecase _getCardsUsecase;
  CardController({
    required GetCardsUsecase getCardsUsecases,
  }) {
    _getCardsUsecase = getCardsUsecases;
  }

  Future<Response> getCards(Request request) async {
    try {
//final response = await _getCardsUsecase.call();
      return Response(200);
    } catch (e) {
      return Response.internalServerError();
    }
  }
}
