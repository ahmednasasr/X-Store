import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_store/features/main_layout/tabs/favourite/presentation/widgets/favourite_item.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../manager/cubit.dart';
import '../../../manager/state.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = MainCubit.get(context)..getWashList();
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
            child: ListView.builder(
              itemCount: cubit.washListProduct.length,
              itemBuilder: (context, index) {
                var favItem = cubit.washListProduct[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                  child: FavoriteItem(product: favItem),
                );
              },
            ));
      },
    );
  }
}
