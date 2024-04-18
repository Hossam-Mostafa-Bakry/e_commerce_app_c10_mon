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
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is CategorySuccessState) {}
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: cubit.widgets[cubit.currentIndex],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: cubit.changeBottomNavBarIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset("assets/icons/home_icn.png"),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset("assets/icons/category_icn.png"),
                    label: "Category",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset("assets/icons/favorite_icn.png"),
                    label: "Favorite",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset("assets/icons/person_icn.png"),
                    label: "Account",
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
