import 'package:marvel_snap/application/usecase/usecase.dart';
import 'package:marvel_snap/domain/usecase/usecase.dart';
import 'package:marvel_snap/infra/factory/factory.dart';

UpdateDatabaseUsecase updateLocationDatabaseUsecaseFactory() =>
    UpdateLocationDatabaseUsecaseImpl(
      httpService: dioAdapterFactory(),
      repository: locationDatabaseRepositoryFactory(),
    );
