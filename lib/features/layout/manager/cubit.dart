import 'package:e_commerce_app_c10_mon/features/layout/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/account_view.dart';
import '../pages/category_view.dart';
import '../pages/favorite_view.dart';
import '../pages/home_view.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeLoadingState());

  static HomeCubit get(context) => BlocProvider.of(context);


  var widgets = <Widget>[
    const HomeView(),
    const CategoryView(),
    const FavoriteView(),
    const AccountView(),
  ];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  changeBottomNavBarIndex(int v) {

    _currentIndex = v;
    emit(ChangeCurrentBottomNavBarIndex());

  }
}
