import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/network_service.dart';
import 'data_source.dart';

@Injectable(as: MainDataSource)
class MainDataSourceImp implements MainDataSource {
  Network network;
  MainDataSourceImp(this.network);
  @override
  Future<Response> getAllCategory() async {
    return await network.get(path: "/api/v1/categories");
  }

  @override
  Future<Response> getAllBrands() async {
    return await network.get(path: "/api/v1/brands");
  }

  @override
  Future<Response> getWashList() async {
    return await network.get(path: "/api/v1/wishlist");
  }
}
