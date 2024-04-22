import 'package:e_commerce_app_c10_mon/core/config/constants.dart';
import 'package:e_commerce_app_c10_mon/core/extensions/padding_ext.dart';
import 'package:e_commerce_app_c10_mon/features/layout/manager/cubit.dart';
import 'package:e_commerce_app_c10_mon/features/layout/manager/states.dart';
import 'package:e_commerce_app_c10_mon/features/layout/pages/account_view.dart';
import 'package:e_commerce_app_c10_mon/features/layout/pages/category_view.dart';
import 'package:e_commerce_app_c10_mon/features/layout/pages/favorite_view.dart';
import 'package:e_commerce_app_c10_mon/features/layout/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getCategory()..getSubCategory(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is CategorySuccessState) {}
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leadingWidth: 100,
              leading: Image.asset(
                'assets/images/route_icn.png',
                color: const Color(0xFF004182),
              ).setHorizontalPadding(context, 0.02),
              backgroundColor: Colors.transparent,
            ),
            body: cubit.widgets[cubit.currentIndex],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: cubit.changeBottomNavBarIndex,
                type: BottomNavigationBarType.shifting,
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset("assets/icons/home_icn.png"),
                    label: "Home",
                    backgroundColor: Constants.theme.primaryColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset("assets/icons/category_icn.png"),
                    label: "Category",
                    backgroundColor: Colors.amber
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset("assets/icons/favorite_icn.png"),
                    label: "Favorite",
                    backgroundColor: Colors.blue
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset("assets/icons/person_icn.png"),
                    label: "Account",
                    backgroundColor: Colors.green
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
