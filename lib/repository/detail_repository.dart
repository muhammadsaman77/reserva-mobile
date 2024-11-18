
import 'package:booking_app/data/model/hotel.dart';
import 'package:booking_app/data/model/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Hotel> getDetailHotel(String id) async {
    final response = await _db.collection("hotels").doc(id).get();
    return Hotel.fromJson(response.data()!,response.id);
  }
  Future<List<Room>> getRooms (String id) async {
    final response = await _db.collection("rooms").where("hotelId",isEqualTo: id).get();
    return response.docs.map((e) => Room(id: e.id, name: e.data()["name"])).toList();
  }

}