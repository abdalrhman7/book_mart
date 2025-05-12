import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DeliveryInWidget extends StatelessWidget {
  const DeliveryInWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w , vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xffFFCCD5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivery in' , style: TextStyles.font14BlackSemiBold,),
          verticalSpace(4),
          Text('1 within Hour' , style: TextStyles.font20BlackSemiBold,)
        ],
      ),
    );
  }
}