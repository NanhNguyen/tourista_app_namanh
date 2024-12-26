class TravelPlace {
  String name;
  String image;
  String description;
  double rating;
  String location;
  TravelPlace({
    required this.name,
    required this.description,
    required this.image,
    required this.location,
    required this.rating,
  });
}

List<TravelPlace> travelPlaces = [
  TravelPlace(
      name: 'Khai island Beach',
      description: 'description',
      image: 'assets/Images/p1bg.jpg',
      location: 'Thailand',
      rating: 4.9)
];
