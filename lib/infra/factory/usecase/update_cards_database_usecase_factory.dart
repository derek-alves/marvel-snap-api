import 'package:marvel_snap/application/usecase/usecase.dart';
import 'package:marvel_snap/domain/usecase/usecase.dart';
import 'package:marvel_snap/infra/factory/http/http.dart';
import 'package:marvel_snap/infra/factory/card_database_repository_impl.dart';

UpdateDatabaseUsecase updateCardsDatabaseUsecaseFactory() =>
    UpdateCardsDatabaseUsecaseImpl(
      httpService: dioAdapterFactory(),
      repository: cardDatabaseRepositoryFactory(),
    );
