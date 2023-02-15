import 'package:marvel_snap/application/usecase/usecase.dart';
import 'package:marvel_snap/domain/usecase/usecase.dart';
import 'package:marvel_snap/infra/factory/http/http.dart';
import 'package:marvel_snap/infra/factory/card_database_repository_impl.dart';

import '../../http/http.dart';

Future<UpdateDatabaseUsecase> updateCardsDatabaseUsecaseFactory() async =>
    UpdateCardsDatabaseUsecaseImpl(
      httpService: dioAdapterFactory(),
      url: await ApiUrlManager().makeMarvelSnapUrl(MarvelSnapDataType.cards),
      repository: cardDatabaseRepositoryFactory(),
    );
