import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/constants_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/routes_manager/routes.dart';
import '../../../../../../core/widgets/heart_button.dart';
import '../../../../../products_screen/data/models/product_response.dart';
import 'add_to_cart_button.dart';
import 'favourite_item_details.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.product});
  final ProductData product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productDetails, arguments: product);
      },
      child: Container(
        height: AppSize.s135.h,
        padding: EdgeInsets.only(right: AppSize.s8.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s16.r),
            border: Border.all(color: ColorManager.primary.withOpacity(.3))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s16.r),
                  border:
                      Border.all(color: ColorManager.primary.withOpacity(.6))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s16.r),
                child: CachedNetworkImage(
                  width: AppSize.s120.w,
                  height: AppSize.s135.h,
                  fit: BoxFit.cover,
                  imageUrl: product.imageCover ?? "",
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: AppSize.s8.w),
                    child: FavouriteItemDetails(
                      product: product,
                    ))),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeartButton(
                  id: "",
                ),
                SizedBox(height: AppSize.s14.h),
                AddToCartButton(
                  onPressed: () {
                    //TODO:add product to cart
                  },
                  text: AppConstants.addToCart,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
