import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:book_mart/features/onboarding/ui/widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: 'assets/images/onboarding1.svg',
          title: context.tr(LocaleKeys.onboardingTitle1),
          subtitle: context.tr(LocaleKeys.onboardingSubtitle1),
        ),
        PageViewItem(
          image: 'assets/images/onboarding2.svg',
          title: context.tr(LocaleKeys.onboardingTitle2),
          subtitle: context.tr(LocaleKeys.onboardingSubtitle2),
        )
      ],
    );
  }
}
