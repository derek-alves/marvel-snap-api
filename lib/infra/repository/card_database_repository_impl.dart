// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../domain/infra/infra.dart';
import '../env/env.dart';

class CardDatabaseRepositoryImpl implements DatabaseUpdateRepository {
  final DatabaseConnection connection;
  CardDatabaseRepositoryImpl({
    required this.connection,
  });
  @override
  Future<void> update() async {
    try {
      var urlDatabase = await CustomEnv.get<String>(key: 'card_database_url');
      var dio = Dio();
      final response = await dio.get(urlDatabase);

      var conn = await connection.connection as Db;
      await conn.open();
      var cardsCollection = conn.collection('cards');
      var bulk =
          UnorderedBulk(cardsCollection, writeConcern: WriteConcern(w: 1));

      final List cards = response.data['success']['cards'];
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

      conn.close();
    } catch (e) {
      throw Exception("[ERROR/DB] -> Failed to update cards database");
    }
  }
}
