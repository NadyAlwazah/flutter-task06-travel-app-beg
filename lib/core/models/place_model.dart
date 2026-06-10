class PlaceModel {
  final String id;
  final String imageUrl;
  final String title;
  final String location;
  final double rating;
  final double price;
  final bool isFavorite;
  final int joinedCount;
  final String dateRange;
  PlaceModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.rating,
    required this.price,
    this.isFavorite = false,
    this.joinedCount = 0,
    required this.dateRange,
  });
  PlaceModel copyWith({
    String? id,
    String? imageUrl,
    String? title,
    String? location,
    double? rating,
    double? price,
    bool? isFavorite,
    int? joinedCount,
    String? dateRange,
  }) {
    return PlaceModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      location: location ?? this.location,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      joinedCount: joinedCount ?? this.joinedCount,
      dateRange: dateRange ?? this.dateRange,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "imageUrl": imageUrl,
      'title': title,
      'location': location,
      'rating': rating,
      'price': price,
      "joinedCount": joinedCount,
      "dateRange": dateRange,
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
      joinedCount: map['joinedCount'] ?? 0,
      dateRange: map['dateRange'] ?? "",
    );
  }
}
