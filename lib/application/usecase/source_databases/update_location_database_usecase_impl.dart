import '../../../domain/infra/infra.dart';
import '../../../domain/usecase/usecase.dart';
import '../../../infra/http/http.dart';

class UpdateLocationDatabaseUsecaseImpl implements UpdateDatabaseUsecase {
  final HttpService httpService;
  final DatabaseUpdateRepository repository;

  UpdateLocationDatabaseUsecaseImpl({
    required this.httpService,
    required this.repository,
  });
  @override
  Future call() async {
    try {
      String url =
          await ApiUrlManager.makeMarvelSnapUrl(MarvelSnapDataType.location);
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
