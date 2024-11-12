import 'package:booking_app/repository/home_repository.dart';
import 'package:dio/dio.dart';

class ApiClient {
  late HomeRepository homeRepository;

  ApiClient(Dio dio) {
    homeRepository = HomeRepository(dio);
  }
}