import '../../../application/usecase/usecase.dart';
import '../../../domain/usecase/usecase.dart';
import '../http/http.dart';
import '../repository/repository.dart';

UpdateDatabaseUsecase updateCardsDatabaseUsecaseFactory() =>
    UpdateCardsDatabaseUsecaseImpl(
      httpService: dioAdapterFactory(),
      repository: cardDatabaseRepositoryFactory(),
    );
