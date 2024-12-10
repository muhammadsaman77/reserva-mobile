import 'package:booking_app/data/model/hotel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<Hotel>> getHotels({String? query}) async {
    final collectionRef = _db.collection("hotels");
    final QuerySnapshot<Map<String, dynamic>> response;

    if (query != null && query.isNotEmpty) {
      response = await collectionRef.get();

      // Filter berdasarkan apakah query ada di mana saja dalam nama hotel
      final filteredHotels = response.docs.where((doc) {
        final hotelName = doc.data()['name'] ?? '';
        return hotelName.toLowerCase().contains(query.toLowerCase());
      }).toList();

      return filteredHotels.map((e) => Hotel.fromJson(e.data(), e.id)).toList();
    } else {
      response = await collectionRef.get();
      return response.docs.map((e) => Hotel.fromJson(e.data(), e.id)).toList();
    }
  }
}
