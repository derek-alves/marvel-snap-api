import '../env/env.dart';

class ApiUrlManager {
  Future<String> makeMarvelSnapUrl(MarvelSnapDataType dataType) async {
    var urlDatabase = await CustomEnv.get<String>(key: 'source_database_url');
    return urlDatabase.replaceAll('[seerchType]', dataType.name);
  }
}

enum MarvelSnapDataType {
  cards,
  location,
}
