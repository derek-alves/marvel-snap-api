import 'package:marvel_snap/domain/infra/infra.dart';
import 'package:marvel_snap/domain/usecase/usecase.dart';

import '../../../infra/http/http.dart';

class UpdateCardsDatabaseUsecaseImpl implements UpdateDatabaseUsecase {
  final HttpService httpService;

  final DatabaseUpdateRepository repository;

  UpdateCardsDatabaseUsecaseImpl({
    required this.httpService,
    required this.repository,
  });
  @override
  Future call() async {
    try {
      String url =
          await ApiUrlManager.makeMarvelSnapUrl(MarvelSnapDataType.cards);
      final response = await httpService.request(
        url: url,
        method: RequestMethod.get,
      );
      await repository.update(response['success']['cards']);
    } catch (e) {
      rethrow;
    }
  }
}
