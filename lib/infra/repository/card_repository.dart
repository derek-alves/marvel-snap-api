import 'package:mongo_dart/mongo_dart.dart';

import '../../domain/entity/entity.dart';
import '../../domain/infra/infra.dart';

class CardRepository implements Repository<Card> {
  late final DbCollection _cardCollection;
  CardRepository({required DatabaseService connection}) {
    connection.connection.then(
      (conn) => _cardCollection = conn.collection('cards'),
    );
  }
  @override
  Future<Card?> findById(int id) async {
    var card = await _cardCollection.findOne({'_id': id});
    if (card != null) return Card.fromJson(card);
    return null;
  }
}
