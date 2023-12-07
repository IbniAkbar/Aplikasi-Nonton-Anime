class AnimeModel {
  final String id;
  final String imagePath;
  final String nameanime;
  final double ratinganime;
  final String episodeanime;
 final String sinopsis;

  AnimeModel({
    required this.id,
    required this.imagePath,
    required this.nameanime,
    required this.ratinganime,
    required this.episodeanime,
    required this.sinopsis,
  });

  factory AnimeModel.fromJson(String id, Map<String, dynamic> json) {
  return AnimeModel(
    id: id,
    imagePath: json['imagePath'],
    nameanime: json['nameanime'],
    ratinganime: json['ratinganime'] is String
        ? double.tryParse(json['ratinganime']) ?? 0.0
        : json['ratinganime'].toDouble(),
    episodeanime: json['episodeanime'],
    sinopsis: json['sinopsis'],
  );
}

}