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
      rating: 4.9),
  TravelPlace(
      name: "Hisma Desert",
      description: '',
      image: "assets/Images/p2bg.jpg",
      location: "Saudi Arabia",
      rating: 4.5),
  TravelPlace(
      name: "Niladri Reservoir",
      description: '',
      image: "assets/Images/niladri.jpg",
      location: "Tekergat, Sunamgnj",
      rating: 4.5),
  TravelPlace(
      name: "Casa Las Tirtugas",
      description: '',
      image: "assets/Images/caslas.jpg",
      location: "Av Damero, Mexico",
      rating: 4.5),
  TravelPlace(
      name: "Aonang Villa Resort",
      description: '',
      image: "assets/Images/aonang.jpg",
      location: "Bastola, Islampur",
      rating: 4.5),
  TravelPlace(
      name: "Rangauti Resort",
      description: '',
      image: "assets/Images/rangauti.jpg",
      location: "Sylhet, Airport Road",
      rating: 4.5),
  TravelPlace(
      name: "Kachura Resort",
      description: '',
      image: "assets/Images/kachura.jpg",
      location: "Vellima, Island",
      rating: 4.5),
  TravelPlace(
      name: "Shakardu Resort",
      description: '',
      image: "assets/Images/shakardu.jpg",
      location: "Shakartu, Pakistan",
      rating: 4.5),
];
