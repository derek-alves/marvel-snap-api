import 'package:marvel_snap/domain/infra/infra.dart';
import 'package:marvel_snap/domain/usecase/usecase.dart';
import 'package:marvel_snap/infra/repository/card_repository.dart';

class UpdateLocationDatabaseUsecaseImpl implements UpdateDatabaseUsecase {
  final HttpService httpService;
  final String url;
  final CardRepository repository;

  UpdateLocationDatabaseUsecaseImpl({
    required this.httpService,
    required this.url,
    required this.repository,
  });
  @override
  Future call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
