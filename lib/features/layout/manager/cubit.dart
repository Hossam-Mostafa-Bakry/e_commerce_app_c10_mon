import '../../../data/data_source/subCategory/sub_category_data_source.dart';
import '../../../data/data_source/subCategory/sub_category_data_source_imp.dart';
import '../../../data/repository_imp/sub_category_repository_imp.dart';
import '../../../domain/entities/category_data_entity.dart';
import '../../../domain/entities/sub_category_entity.dart';
import '../../../domain/repository/sub_category_repository.dart';
import '../../../domain/use_cases/sub_category_use_case.dart';
import '../../../core/services/web_serivces.dart';
import '../../../data/data_source/category/category_data_source.dart';
import '../../../data/data_source/category/category_data_source_imp.dart';
import '../../../data/repository_imp/category_repository_imp.dart';
import '../../../domain/repository/category_repository.dart';
import '../../../domain/use_cases/category_use_case.dart';
import '../../../features/layout/manager/states.dart';
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
  List<CategoryDataEntity> _categories = [];
  List<SubCategoryEntity> _subCategories = [];

  int get currentIndex => _currentIndex;

  List<CategoryDataEntity> get categories => _categories;

  List<SubCategoryEntity> get subCategories => _subCategories;

  final WebServices _services = WebServices();

  late CategoryUseCase categoryUseCase;
  late CategoryRepository categoryRepository;
  late CategoryDataSource categoryDataSource;

  late SubCategoryDataSource subCategoryDataSource;
  late SubCategoryRepository subCategoryRepository;
  late SubCategoryUseCase subCategoryUseCase;

  changeBottomNavBarIndex(int v) {
    _currentIndex = v;
    emit(ChangeCurrentBottomNavBarIndex());
  }

  Future<bool> getCategory() async {
    categoryDataSource = CategoryDataSourceImp(_services.freeDio);
    categoryRepository = CategoryRepositoryImp(categoryDataSource);
    categoryUseCase = CategoryUseCase(categoryRepository);

    final result = await categoryUseCase.execute();

    return result.fold(
      (fail) {
        emit(CategoryErrorState());
        return Future.value(false);
      },
      (data) {
        _categories = data;
        emit(CategorySuccessState());
        return Future.value(true);
      },
    );
  }

  Future<bool> getSubCategory() async {
    subCategoryDataSource = SubCategoryDataSourceImp(_services.freeDio);
    subCategoryRepository = SubCategoryRepositoryImp(subCategoryDataSource);
    subCategoryUseCase = SubCategoryUseCase(subCategoryRepository);

    final result = await subCategoryUseCase.execute();

    return result.fold(
      (fail) {
        emit(SubCategoryErrorState());
        return Future.value(false);
      },
      (data) {

        _subCategories = data;

        List<SubCategoryEntity> dataList = [];

        for (var i = 0; i < _categories.length; i++) {
          for (var element in _subCategories) {
            if (_categories[i].id == element.categoryId) {
              dataList.add(element);
            }
          }
          _categories[i].subCategories = dataList;
          dataList = [];
          print(_categories[i].subCategories!.length);
          print("----------------------333####");
        }
        emit(SubCategorySuccessState());
        return Future.value(true);
      },
    );
  }
}
