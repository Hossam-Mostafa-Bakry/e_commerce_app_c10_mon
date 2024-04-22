import 'package:e_commerce_app_c10_mon/domain/entities/sub_category_entity.dart';
import 'package:flutter/material.dart';

typedef OnSubCategoryClicked = void Function(SubCategoryEntity)?;

class CustomSubCategoryItem extends StatelessWidget {
  final int index;
  final SubCategoryEntity subCategoryModel;
  final OnSubCategoryClicked onSubCategoryClicked;

  const CustomSubCategoryItem(
      {super.key,
      required this.index,
      required this.subCategoryModel,
      this.onSubCategoryClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onSubCategoryClicked == null) return;
        onSubCategoryClicked!(subCategoryModel);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/beauty.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            subCategoryModel.name,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF06004F),
            ),
          ),
        ],
      ),
    );
  }
}
