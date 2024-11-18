import 'package:booking_app/data/model/hotel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepository {
  final _db = FirebaseFirestore.instance;
  Future<List<Hotel>> getHotels() async {
    final response = await _db.collection("hotels").get();
    return response.docs.map((e) => Hotel.fromJson(e.data(),e.id)).toList();
  }


}