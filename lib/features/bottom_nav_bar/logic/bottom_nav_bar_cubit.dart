import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';


part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());
  final bottomNavbarController = PersistentTabController();

}
