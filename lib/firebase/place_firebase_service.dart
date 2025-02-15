import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:tourista_app/firebase/travel_places_model.dart';

class TravelPlaceFirebaseService {
  static final DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref('travelPlaces');

  static Stream<List<TravelPlacesModel>>? get travelPlaceStream {
    return databaseReference.onValue
        .asBroadcastStream()
        .map<List<TravelPlacesModel>>((event) {
      final data = event.snapshot.value.toMap ?? {};
      List<Map<String, dynamic>> values =
          data.entries.map<Map<String, dynamic>>((entry) {
        return entry.value as Map<String, dynamic>;
      }).toList();
      final places = values.map(
        (e) {
          return TravelPlacesModel.fromJson(e);
        },
      ).toList();
      return places;
    });
  }

  static void addTravelPlace({
    required String id,
    required String name,
    required String address,
    required String description,
  }) {
    final place = {
      'name': name,
      'double': id,
      'address': address,
      'description': description,
    };
    databaseReference.child(id).set(place);
  }

  static void editTravelPlace({
    required String id,
    required String name,
    required String address,
    required String description,
  }) {
    final place = {
      'name': name,
      'address': address,
      'description': description,
    };
    databaseReference.child(id).set(place);
  }

  static void deleteProduct({
    required String id,
  }) {
    databaseReference.child(id).remove();
  }
}

extension ObjectEX on Object? {
  // get: lay ve du lieu kieu map<string dynamic>
  Map<String, dynamic>? get toMap {
    // this o day = value o dong 14
    if (this == null) return null;
    Map<String, dynamic> data = Map<String, dynamic>.from(this as Map);
    // dua map ve dang string vi co dau ""
    String jsonString = json.encode(data);
    //decode thi xoa dau "" de dua data sang dang map
    Map<String, dynamic> jsonConvert = json.decode(jsonString);
    return jsonConvert;
  }
}
