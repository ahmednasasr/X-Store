import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/network_service.dart';
import 'data_source.dart';

@Injectable(as: CartDataSource)
class CartDataSourceImp implements CartDataSource {
  Network network;
  CartDataSourceImp(this.network);

  @override
  Future<Response> getCart() async {
    return await network.get(path: "/api/v1/cart");
  }
}
