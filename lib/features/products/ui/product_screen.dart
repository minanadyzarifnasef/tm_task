import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamweelytask/core/constants/dimensions_constants.dart';
import 'package:tamweelytask/core/theming/widgets/subtitle_text.dart';
import 'package:tamweelytask/features/products/logic/products_cubit.dart';
import 'package:tamweelytask/features/products/logic/products_state.dart';
import 'package:tamweelytask/features/products/ui/widgets/loading_list.dart';
import 'package:tamweelytask/features/products/ui/widgets/products_list.dart';

import '../../../core/theming/widgets/appbar.dart';
import '../../../core/theming/widgets/loader.dart';
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:GradientAppBar(title: 'products'.tr(),back: true,),
      body: Container(
        width: width.w,height: height.h,
        margin: EdgeInsets.all(edge),
        child: BlocBuilder<ProductsCubit,ProductsState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context,state) {
            return state.when(
              initial:()=> const Loader(),
              loading: ()=>const LoadingList(),
              success: (response)=> ProductsList(productsResponse: response,),
              error: (error)=>Center( child: SubTitleText(text: error),),

            );
          },
        ),
      ),
    );
  }
}
