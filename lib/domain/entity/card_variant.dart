class CardVariant {
  final int id;
  final int cardId;
  final String img;
  final String status;
  final String rarity;
  final String sketcher;
  final String inker;
  final String colorist;

  CardVariant({
    required this.id,
    required this.cardId,
    required this.img,
    required this.status,
    required this.rarity,
    required this.sketcher,
    required this.inker,
    required this.colorist,
  });

  factory CardVariant.fromJson(Map<String, dynamic> json) => CardVariant(
        id: json["vid"] as int,
        cardId: json["cid"],
        img: json["art"],
        rarity: json["rarity"],
        status: json["status"],
        colorist: json["colorist"],
        inker: json["inker"],
        sketcher: json["sketcher"],
      );
}
