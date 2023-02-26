import 'package:mongo_dart/mongo_dart.dart';

import '../../domain/entity/location.dart';
import '../../domain/infra/infra.dart';

class LocationRepository implements Repository<Location> {
  late final DbCollection _locationCollection;
  LocationRepository({required DatabaseService connection}) {
    connection.connection.then(
      (conn) => _locationCollection = conn.collection('locations'),
    );
  }
  @override
  Future<Location?> findById(int id) async {
    var location = await _locationCollection.findOne({'_id': id});
    if (location != null) return Location.fromJson(location);
    return null;
  }
}
