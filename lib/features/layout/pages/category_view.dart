import 'package:e_commerce_app_c10_mon/core/config/constants.dart';
import 'package:e_commerce_app_c10_mon/domain/entities/sub_category_entity.dart';
import 'package:e_commerce_app_c10_mon/features/layout/manager/cubit.dart';
import 'package:e_commerce_app_c10_mon/features/layout/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_sub_category_item.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int selectedIndex = 0;
  List<String> categoriesList = [
    "Men’s Fashion",
    "Women’s Fashion",
    "Skincare",
    "Beauty",
    "Cameras",
    "Laptops & Electronics",
    "Baby & Toys",
  ];
  final List<SubCategoryEntity> subCategoriesList = [
    SubCategoryEntity(
      categoryId: "1",
      id: "t-shirts",
      name: "T-shirts",
      image: "assets/images/sub_category_t-shirts.png",
    ),
    SubCategoryEntity(
      categoryId: "1",
      id: "shorts",
      name: "Shorts",
      image: "assets/images/sub_category_shorts.png",
    ),
    SubCategoryEntity(
      categoryId: "1",
      id: "jeans",
      name: "Jeans",
      image: "assets/images/sub_category_jeans.png",
    ),
    SubCategoryEntity(
      categoryId: "1",
      id: "pants",
      name: "Pants",
      image: "assets/images/sub_category_pants.png",
    ),
    SubCategoryEntity(
      categoryId: "1",
      id: "footwear",
      name: "Footwear",
      image: "assets/images/sub_category_footwear.png",
    ),
    SubCategoryEntity(
      categoryId: "1",
      id: "suits",
      name: "Suits",
      image: "assets/images/sub_category_suits.png",
    ),
    SubCategoryEntity(
      categoryId: "1",
      id: "watches",
      name: "Watches",
      image: "assets/images/sub_category_watches.png",
    ),
    SubCategoryEntity(
      categoryId: "1",
      id: "bags",
      name: "Bags",
      image: "assets/images/sub_category_bags.png",
    ),
    SubCategoryEntity(
      categoryId: "1",
      id: "eyewears",
      name: "Eyewears",
      image: "assets/images/sub_category_eyewears.png",
    ),
  ];
  final PageController _tabsController = PageController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFDBE4ED).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: SizedBox(
                    width: mediaQuery.width * 0.3,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              _tabsController.jumpToPage(index);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: (selectedIndex == index)
                                  ? Colors.white
                                  : const Color(0xFFDBE4ED).withOpacity(0),
                            ),
                            child: Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 300,
                                  ),
                                  height: (selectedIndex == index) ? 50 : 0,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF004182),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      cubit.categories[index].name,
                                      style: Constants
                                          .theme.textTheme.bodyMedium
                                          ?.copyWith(
                                              color:
                                                  Constants.theme.primaryColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 20);
                      },
                      itemCount: cubit.categories.length,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: PageView(
                    controller: _tabsController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cubit.categories[selectedIndex].name,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.theme.primaryColor),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 15, right: 15, bottom: 8, left: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    cubit.categories[selectedIndex].imageUrl,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '''Men’s
                                    Fashion''',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      height: 0.5,
                                      color: Color(0xFF06004F),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF004182),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      minimumSize: const Size(88, 30),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "Shop Now",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 3 / 4),
                                itemBuilder: (context, index) =>
                                    CustomSubCategoryItem(
                                  index: index,
                                  subCategoryModel: cubit
                                      .categories[selectedIndex]
                                      .subCategories![index],
                                  onSubCategoryClicked: onSubCategoryClicked,
                                ),
                                itemCount: cubit.categories[selectedIndex]
                                    .subCategories?.length,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  SubCategoryEntity? selectSubCategory;

  void onSubCategoryClicked(SubCategoryEntity subCategoryModel) {
    selectSubCategory = subCategoryModel;
    setState(() {});
  }
}
