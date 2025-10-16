class TravelPlacesModel {
  int id;
  bool save;
  String name;
  String image;
  String description;
  double rating;
  String location;
  TravelPlacesModel({
    required this.id,
    this.save = false,
    required this.name,
    required this.description,
    required this.image,
    required this.location,
    required this.rating,
  });
  factory TravelPlacesModel.fromJson(Map<String, dynamic> value) {
    return TravelPlacesModel(
        id: value['id'],
        name: value['name'],
        description: value["description"],
        image: value["image"],
        location: value["location"],
        rating: value["rating"]);
  }
}
