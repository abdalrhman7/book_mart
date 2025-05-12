import 'package:book_mart/core/constants/app_constants.dart';
import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/helper/shared_pref_helper.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/change_lang_button.dart';
import 'package:book_mart/features/onboarding/ui/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;

  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              verticalSpace(8),
              Row(
                children: [
                  Text('${currentPage + 1}/2',
                      style: TextStyles.font18BlackSemiBold),
                  const Spacer(),
                  const ChangeLangButton(),
                ],
              ),
              Expanded(
                child: OnBoardingPageView(
                  pageController: pageController,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Visibility(
                      visible: currentPage > 0,
                      child: GestureDetector(
                        onTap: () {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        },
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            context.tr(LocaleKeys.previous),
                            style: TextStyles.font14BlackSemiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: 2,
                    decorator: DotsDecorator(
                      activeColor: ColorsManager.mainBinkColor,
                      color: currentPage == 1
                          ? ColorsManager.mainBinkColor
                          : ColorsManager.mainBinkColor.withOpacity(.5),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (currentPage > 0) {
                          SharedPrefHelper.setData(
                              SharedPrefKeys.isOnBoardingSeen, true);
                          context.pushNamedAndRemoveUntil(Routes.loginScreen,
                              predicate: (route) => false);
                        } else {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        }
                      },
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          currentPage > 0
                              ? context.tr(LocaleKeys.start)
                              : context.tr(LocaleKeys.next),
                          style: TextStyles.font14BlackSemiBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }
}

