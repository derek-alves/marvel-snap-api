import 'package:marvel_snap/domain/infra/infra.dart';
import 'package:marvel_snap/domain/usecase/usecase.dart';

class UpdateCardsDatabaseUsecaseImpl implements UpdateDatabaseUsecase {
  final HttpService httpService;
  final String url;
  final DatabaseUpdateRepository repository;

  UpdateCardsDatabaseUsecaseImpl({
    required this.httpService,
    required this.url,
    required this.repository,
  });
  @override
  Future call() async {
    try {
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
