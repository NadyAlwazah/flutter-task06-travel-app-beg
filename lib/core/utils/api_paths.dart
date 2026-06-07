class ApiPaths {
  static String users(String userId) => "users/$userId";
  static String places([String? placeId]) =>
      placeId != null ? "places/$placeId" : "places/";

  static String favoritePlace(String userId, String placeId) =>
      "users/$userId/favorites/$placeId";
  static String favoritePlaces(String userId) => "users/$userId/favorites/";
}
