class ApiPaths {
  static String users(String userId) => "users/$userId";
  static String places([String? placeId]) =>
      placeId != null ? "places/$placeId" : "places/";
}
