import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';

class CareRecommendationItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;

  CareRecommendationItem({
    Key? key,
    required this.image,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: image,
              height: 91.h,
              width: 110.h,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(4.h),
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: TextStyleHelper.instance.body14MediumInter,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
