import 'entity.dart';

class Card {
  final int id;
  final String name;
  final String ability;
  final String img;
  final String status;
  final String rarity;
  final int cost;
  final int power;
  final String content;
  final String sketcher;
  final String inker;
  final String colorist;
  final List<CardVariant> variants;

  Card({
    required this.id,
    required this.name,
    required this.ability,
    required this.img,
    required this.status,
    required this.rarity,
    required this.cost,
    required this.power,
    required this.content,
    required this.sketcher,
    required this.inker,
    required this.colorist,
    required this.variants,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        id: json["cid"] as int,
        img: json["art"],
        rarity: json["rarity"],
        status: json["status"],
        colorist: json["colorist"],
        inker: json["inker"],
        sketcher: json["sketcher"],
        ability: json["ability"],
        content: json["flavor"],
        cost: json["cost"] as int? ?? 0,
        power: json["power"] as int? ?? 0,
        name: json["name"],
        variants: (json["variants"] as List<Map<String, dynamic>>)
            .map(
              (variant) => CardVariant.fromJson(variant),
            )
            .toList(),
      );
}
