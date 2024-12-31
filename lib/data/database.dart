import 'package:firebase_database/firebase_database.dart';

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
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "description": description,
      'rating': rating,
      'location': location
    };
  }
}

List<TravelPlace> travelPlaces = [
  TravelPlace(
      name: 'Khai island Beach',
      description:
          "Located off the east coast of Phuket, Thailand, Khai Island is known for its tranquil white sand beaches and clear blue waters. It's a popular spot for snorkeling, swimming, and relaxing on the beach.",
      image: 'assets/Images/p1bg.jpg',
      location: 'Thailand',
      rating: 4.9),
  TravelPlace(
      name: "Hisma Desert",
      description:
          "Situated in northwest Saudi Arabia, Hisma Desert features striking red sands and sandstone mountains. It's rich in geological wonders and ancient inscriptions, offering a unique desert landscape.",
      image: "assets/Images/p2bg.jpg",
      location: "Saudi Arabia",
      rating: 4.5),
  TravelPlace(
      name: "Niladri Reservoir",
      description:
          "A serene water body surrounded by lush greenery, Niladri Reservoir is an ideal spot for boating, fishing, and enjoying nature.",
      image: "assets/Images/niladri.jpg",
      location: "Tekergat, Sunamgnj",
      rating: 4.5),
  TravelPlace(
      name: "Casa Las Tirtugas",
      description:
          "Nestled in the Galapagos Islands, Casa Las Tirtugas offers stunning views of the ocean and is known for its luxury accommodations and proximity to wildlife.",
      image: "assets/Images/caslas.jpg",
      location: "Av Damero, Mexico",
      rating: 4.5),
  TravelPlace(
      name: "Aonang Villa Resort",
      description:
          'Located in Krabi, Thailand, Aonang Villa Resort offers beautiful villas with private pools, perfect for a relaxing beach getaway.',
      image: "assets/Images/aonang.jpg",
      location: "Bastola, Islampur",
      rating: 4.5),
  TravelPlace(
      name: "Rangauti Resort",
      description:
          'A charming resort offering comfortable accommodations and beautiful views, Rangauti Resort is a great place to unwind and enjoy the natural surroundings.',
      image: "assets/Images/rangauti.jpg",
      location: "Sylhet, Airport Road",
      rating: 4.5),
  TravelPlace(
      name: "Kachura Resort",
      description:
          'Situated in Pakistan, Kachura Resort is known for its stunning location by the lake, offering activities like boating and fishing, along with cozy accommodations.',
      image: "assets/Images/kachura.jpg",
      location: "Vellima, Island",
      rating: 4.5),
  TravelPlace(
      name: "Shakardu Resort",
      description:
          'Located in the scenic region of Gilgit-Baltistan, Pakistan, Shakardu Resort provides a peaceful retreat with beautiful views and opportunities for outdoor activities.',
      image: "assets/Images/shakardu.jpg",
      location: "Shakartu, Pakistan",
      rating: 4.5),
];

Future<void> uploadTravelPlacesToFireBaseIfNotExist() async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("travelPlaces");
  DatabaseEvent event = await ref.once();
  if (event.snapshot.value == null) {
    for (var place in travelPlaces) {
      await ref.push().set(place.toJson());
    }
    print("Data has been pushed on Firebase");
  } else {
    print("Data is existed");
  }
}
