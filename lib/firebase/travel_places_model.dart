class TravelPlacesModel {
  bool favorite;
  String id;
  String name;
  String image;
  String description;
  double rating;
  String location;
  TravelPlacesModel({
    this.favorite = false,
    this.id = "0",
    required this.name,
    required this.description,
    this.image = "",
    required this.location,
    required this.rating,
  });
  factory TravelPlacesModel.fromJson(Map<String, dynamic> value) {
    return TravelPlacesModel(
        // favorite: value['favorite'] ?? false,
        // id: value['id'] == null ? "0" : value['id'].toString(),
        name: value['name'] ?? "",
        description: value["description"] ?? "",
        // image: value["image"] ?? "",
        location: value["location"] ?? "",
        rating: value["rating"] ?? 0.0);
  }
}
