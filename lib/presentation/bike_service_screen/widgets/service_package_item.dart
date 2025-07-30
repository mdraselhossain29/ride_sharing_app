import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';

class ServicePackageItem extends StatelessWidget {
  final String image;
  final String title;
  final String currentPrice;
  final String originalPrice;
  final String discount;
  final VoidCallback? onTap;

  ServicePackageItem({
    Key? key,
    required this.image,
    required this.title,
    required this.currentPrice,
    required this.originalPrice,
    required this.discount,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: image,
            height: 110.h,
            width: double.maxFinite,
            fit: BoxFit.cover,
            radius: BorderRadius.circular(4.h),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyleHelper.instance.body14MediumInter,
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text(
                currentPrice,
                style: TextStyleHelper.instance.title16SemiBoldInter,
              ),
              SizedBox(width: 8.h),
              Text(
                originalPrice,
                style: TextStyleHelper.instance.body12RegularInter
                    .copyWith(decoration: TextDecoration.lineThrough),
              ),
              SizedBox(width: 8.h),
              Text(
                discount,
                style: TextStyleHelper.instance.body12RegularInter
                    .copyWith(color: appTheme.colorFF584C),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
