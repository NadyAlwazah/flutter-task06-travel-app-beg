class PlaceModel {
  final String id;
  final String imageUrl;
  final String title;
  final String location;
  final double rating;
  final double price;
  final bool isFavorite;

  PlaceModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.rating,
    required this.price,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      "imageUrl": imageUrl,
      'title': title,
      'location': location,
      'rating': rating,
      'price': price,
      "isFavorite": isFavorite,
    };
  }

  factory PlaceModel.fromMap(String id, Map<String, dynamic> map) {
    return PlaceModel(
      id: id,
      imageUrl: map['imageUrl'] ?? '',
      title: map['title'] ?? '',
      location: map['location'] ?? '',
      rating: (map['rating'] as num).toDouble(),
      price: (map['price'] as num).toDouble(),
      isFavorite: map['isFavorite'],
    );
  }
}
