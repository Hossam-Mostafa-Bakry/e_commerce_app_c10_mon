import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';
import '../../../domain/entities/carousel_model.dart';

class CustomCursorSlider extends StatelessWidget {
  const CustomCursorSlider({Key? key, required this.carouselModel})
      : super(key: key);
  final CarouselModel carouselModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(carouselModel.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: 150,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'UP TO\n',
                    style: Constants.theme.textTheme.titleLarge?.copyWith(
                      color: Constants.theme.primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  TextSpan(
                    text: '25% ',
                    style: Constants.theme.textTheme.titleLarge?.copyWith(
                      color: Constants.theme.primaryColor,
                      fontSize: 30,
                    ),
                  ),
                  TextSpan(
                    text: 'OFF\n' ,
                    style: Constants.theme.textTheme.titleLarge?.copyWith(
                      color: Constants.theme.primaryColor,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: 'For all Headphones\n& AirPods',
                    style: Constants.theme.textTheme.bodySmall?.copyWith(
                      color: Constants.theme.primaryColor,
                      )),

                ]),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: () {},
              child: Text(
                'Shop Now',
                textAlign: TextAlign.center,
                style: Constants.theme.textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
