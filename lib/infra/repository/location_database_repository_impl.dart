// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mongo_dart/mongo_dart.dart';

import '../../domain/infra/infra.dart';

class LocationDatabaseRepositoryImpl implements DatabaseUpdateRepository {
  final DatabaseService connection;

  LocationDatabaseRepositoryImpl({
    required this.connection,
  });
  @override
  Future<void> update(List locations) async {
    try {
      var conn = await connection.connection as Db;

      var locationsCollection = conn.collection('locations');
      var bulk =
          UnorderedBulk(locationsCollection, writeConcern: WriteConcern(w: 1));

      for (var location in locations) {
        location.addAll({
          '_id': location['cid'],
          'dt_updated': DateTime.now().toIso8601String(),
        });
        location.remove('cid');
        location.removeWhere(
          (key, _) =>
              key == 'cid' ||
              key == 'cost' ||
              key == 'power' ||
              key == 'flavor' ||
              key == 'variants' ||
              key == 'tags' ||
              key == 'url',
        );

        var existentlocation =
            await locationsCollection.findOne({'_id': location['_id']});
        if (existentlocation != null) {
          bulk.updateOne(
            UpdateOneStatement(
              {'_id': location['_id']},
              {'\$set': location},
            ),
          );
        } else {
          bulk.insertOne(location);
        }
      }
      await bulk.executeBulk();

      return;
    } catch (e) {
      throw Exception("[ERROR/DB] -> Failed to update locations database");
    }
  }
}
