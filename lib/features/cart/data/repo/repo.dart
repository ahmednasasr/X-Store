import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entity/cart_data.dart';
import '../../domain/repo/repo.dart';
import '../data_source/data_source.dart';
import '../models/cart_response.dart';

@Injectable(as: CartRepo)
class CartRepoImp implements CartRepo {
  CartDataSource dataSource;
  CartRepoImp(this.dataSource);
  @override
  Future<Either<String, CartData>> getCart() async {
    try {
      var response = await dataSource.getCart();

      if (response.statusCode == 200) {
        CartData data = CartResponse.fromJson(response.data);
        return Right(data);
      } else {
        return Left(response.data["message"] ?? "");
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }

      return Left(e.toString());
    }
  }
}
