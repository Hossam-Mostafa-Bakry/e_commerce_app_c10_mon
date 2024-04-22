import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_c10_mon/core/extensions/padding_ext.dart';
import 'package:e_commerce_app_c10_mon/features/layout/manager/cubit.dart';
import 'package:e_commerce_app_c10_mon/features/layout/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/config/constants.dart';
import '../../../domain/entities/carousel_model.dart';
import '../../../domain/entities/category_model.dart';
import '../../../domain/entities/home_appliance_section_model.dart';
import '../widgets/custom_carousel_slider.dart';
import '../widgets/custom_category_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<HomeApplianceSection> sections = [
    HomeApplianceSection(
        imageUrl: 'assets/images/washingm2.jpg',
        itemName: 'Washing Machine',
        rate: 4.8),
    HomeApplianceSection(
        imageUrl: 'assets/images/thumbnail.jpg',
        itemName: 'New Cooker',
        rate: 4.6),
    HomeApplianceSection(
        imageUrl: 'assets/images/washingm2.jpg', itemName: 'Steam', rate: 2.5),
    HomeApplianceSection(
        imageUrl: 'assets/images/washingm2.jpg', itemName: 'Steam', rate: 2.5),
  ];
  final List<CarouselModel> carouselList = [
    CarouselModel(
      imageUrl: 'assets/images/slider.png',
      // offerText: 'UP TO 25% OFF' ),
    ),
    CarouselModel(
      imageUrl: 'assets/images/slider.png',
      // offerText: 'UP TO 25% OFF' ),
    ),
    CarouselModel(
      imageUrl: 'assets/images/slider.png',
      // offerText: 'UP TO 25% OFF' ),
    ),
  ];
  final controller = PageController(viewportFraction: .8, keepPage: true);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return SizedBox(
            height: Constants.mediaQuery.size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: theme.primaryColor, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    color: theme.primaryColor, width: 1),
                              ),
                              prefixIcon: const Icon(
                                Icons.search_rounded,
                                color: Color(0xFF004182),
                                size: 20,
                              ),
                              hintText: 'What do you search for?',
                              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                                color: const Color(0xFF06004F).withOpacity(0.4),
                              ),
                              hintMaxLines: 1,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 30,
                          color: theme.primaryColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      alignment: const Alignment(.01, .9),
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            height: 200,
                            viewportFraction: .97,
                            enableInfiniteScroll: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.easeOutQuad,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                            // disableCenter : true,
                          ),
                          itemCount: 3,
                          itemBuilder: (context, index, realIndex) {
                            return CustomCursorSlider(
                                carouselModel: carouselList[index]);
                          },
                        ),
                        AnimatedSmoothIndicator(
                          axisDirection: Axis.horizontal,
                          activeIndex: currentIndex,
                          count: carouselList.length,
                          effect: const SlideEffect(
                              spacing: 8.0,
                              radius: 25.0,
                              dotWidth: 10.0,
                              dotHeight: 10.0,
                              paintStyle: PaintingStyle.fill,
                              strokeWidth: 1.5,
                              dotColor: Colors.white,
                              activeDotColor: Colors.indigo),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: Constants.theme.textTheme.bodyLarge
                              ?.copyWith(color: Colors.black),
                        ),
                        Text(
                          'view all',
                          style: Constants.theme.textTheme.bodyLarge
                              ?.copyWith(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: Constants.mediaQuery.size.height * 0.35,
                      child: GridView.builder(
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1.2),
                        itemCount: cubit.categories.length,
                        itemBuilder: (context, index) {
                          return CustomCategoryItem(
                            categoryModel: cubit.categories[index],
                          );
                        },
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          );
        });
  }
}
