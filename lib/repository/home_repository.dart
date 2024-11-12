import 'package:booking_app/config/api_config.dart';
import 'package:booking_app/data/model/hotel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class HomeRepository {
  factory HomeRepository(Dio dio, {String baseUrl}) = _HomeRepository;

  @GET('/api/v1/hotels')
  Future<List<Hotel>> getHotels();
}