import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.subtitle,
    required this.title,
  });

  final String image;
  final String subtitle;
  final String title;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.6,
          child: SvgPicture.asset(
            image,
          ),
        ),
        verticalSpace(24),
        Text(title, style: TextStyles.font24BlackBold,),
        verticalSpace(24),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 26,
          ),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyles.font14GrayRegular,
          ),
        )
      ],
    );
  }
}

// onTap: () {
// // Prefs.setBool(kIsOnBoardingViewSeen, true);
// // Navigator.of(context).pushReplacementNamed(
// //   SignInView.routeName,
// // );
// },