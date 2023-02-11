class Location {
  final int id;
  final String name;
  final String ability;
  final String img;
  final String status;
  final String rarity;

  final String difficulty;

  Location({
    required this.id,
    required this.name,
    required this.ability,
    required this.img,
    required this.status,
    required this.rarity,
    required this.difficulty,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["cid"] as int,
        ability: json["ability"],
        name: json["name"],
        difficulty: json["difficulty"],
        img: json["art"],
        rarity: json["rarity"],
        status: json["status"],
      );
}
