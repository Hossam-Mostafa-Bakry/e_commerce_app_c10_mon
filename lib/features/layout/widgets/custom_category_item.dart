import '../../../domain/entities/category_data_entity.dart';
import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key, required this.categoryModel});

  final CategoryDataEntity categoryModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(categoryModel.imageUrl),
              fit: BoxFit.cover
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 110,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 12),
            child: Text(
              categoryModel.name,
              textAlign: TextAlign.center,
              style: Constants.theme.textTheme.bodySmall?.copyWith(
                color: Colors.black
              ),
              maxLines: 2,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
