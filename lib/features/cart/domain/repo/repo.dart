import 'package:dartz/dartz.dart';

import '../entity/cart_data.dart';

abstract class CartRepo {
  Future<Either<String, CartData>> getCart();
}
