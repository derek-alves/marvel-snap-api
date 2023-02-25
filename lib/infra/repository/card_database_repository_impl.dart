// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mongo_dart/mongo_dart.dart';

import '../../domain/infra/infra.dart';

class CardDatabaseRepositoryImpl implements DatabaseUpdateRepository {
  final DatabaseService connection;

  CardDatabaseRepositoryImpl({
    required this.connection,
  });
  @override
  Future<void> update(List cards) async {
    try {
      var conn = await connection.connection as Db;

      var cardsCollection = conn.collection('cards');
      var bulk =
          UnorderedBulk(cardsCollection, writeConcern: WriteConcern(w: 1));

      for (var card in cards) {
        card.addAll({
          '_id': card['cid'],
          'dt_updated': DateTime.now().toIso8601String(),
        });
        card.remove('cid');

        var existentCard = await cardsCollection.findOne({'_id': card['_id']});
        if (existentCard != null) {
          bulk.updateOne(
            UpdateOneStatement(
              {'_id': card['_id']},
              {'\$set': card},
            ),
          );
        } else {
          bulk.insertOne(card);
        }
      }
      await bulk.executeBulk();
    } catch (e) {
      throw Exception("[ERROR/DB] -> Failed to update cards database");
    }
  }
}
