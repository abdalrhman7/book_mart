import 'package:badges/badges.dart' as badges;
import 'package:book_mart/core/constants/locale_keys.dart';
import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/features/books_screen/ui/books_screen.dart';
import 'package:book_mart/features/bottom_nav_bar/logic/bottom_nav_bar_cubit.dart';
import 'package:book_mart/features/cart/logic/cart_cubit.dart';
import 'package:book_mart/features/cart/ui/cart_screen.dart';
import 'package:book_mart/features/home/ui/home_screen.dart';
import 'package:book_mart/features/profile/ui/profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const BooksScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentTabConfig> _navBarsItems() {
    return [
      PersistentTabConfig(
        screen: _buildScreens()[0],
        item: ItemConfig(
          activeForegroundColor: ColorsManager.mainBinkColor,
          icon: const Icon(Icons.home_outlined),
          title: context.tr(LocaleKeys.home),
        ),
      ),
      PersistentTabConfig(
        screen: _buildScreens()[1],
        item: ItemConfig(
          activeForegroundColor: ColorsManager.mainBinkColor,
          icon: const Icon(Icons.chrome_reader_mode_outlined),
          title: context.tr(LocaleKeys.books),
        ),
      ),
      PersistentTabConfig(
        screen: _buildScreens()[2],
        item: ItemConfig(
          activeForegroundColor: ColorsManager.mainBinkColor,
          icon: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return badges.Badge(
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: ColorsManager.mainBinkColor,
                ),
                badgeContent: Text(
                  '${context.read<CartCubit>().cartItemCount}',
                  style: TextStyles.font12BlackSemiBold
                      .copyWith(color: Colors.white),
                ),
                showBadge: context.read<CartCubit>().cartItemCount != 0,
                child: const Icon(Icons.shopping_cart_outlined),
              );
            },
          ),
          title: context.tr(LocaleKeys.cart),
        ),
      ),
      PersistentTabConfig(
        screen: _buildScreens()[3],
        item: ItemConfig(
          activeForegroundColor: ColorsManager.mainBinkColor,
          icon: const Icon(Icons.person_outline),
          title: context.tr(LocaleKeys.profile),

        ),
      ),
    ];
  }

  PersistentTabView _persistentTabView() {
    return PersistentTabView(
      tabs: _navBarsItems(),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6), topRight: Radius.circular(6)),
          color: Colors.white,
          border: Border.all(width: .5, color: Colors.grey.shade400),
        ),
      ),
      controller: context.read<BottomNavBarCubit>().bottomNavbarController,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      resizeToAvoidBottomInset: true,
      navBarOverlap: const NavBarOverlap.custom(overlap: -1),
      navBarHeight: 56.h,
      onTabChanged: (value) {
        if (value == 2) {
          context.read<CartCubit>().getCart();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _persistentTabView(),
    );
  }
}
