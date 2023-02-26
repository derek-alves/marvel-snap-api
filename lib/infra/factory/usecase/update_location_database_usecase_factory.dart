import '../../../application/usecase/usecase.dart';
import '../../../domain/usecase/usecase.dart';
import '../factory.dart';

UpdateDatabaseUsecase updateLocationDatabaseUsecaseFactory() =>
    UpdateLocationDatabaseUsecaseImpl(
      httpService: dioAdapterFactory(),
      repository: locationDatabaseRepositoryFactory(),
    );
