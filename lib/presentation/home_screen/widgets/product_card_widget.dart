import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';

class ProductCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String originalPrice;
  final String discount;
  final String rating;

  ProductCardWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 173.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: image,
            height: 110.h,
            width: 173.h,
            fit: BoxFit.cover,
            radius: BorderRadius.circular(4.h),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            style: TextStyleHelper.instance.body14MediumInter,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                price,
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
          SizedBox(height: 8.h),
          Row(
            children: [
              Container(
                width: 19.h,
                height: 19.h,
                decoration: BoxDecoration(
                  color: appTheme.colorFFFFA0,
                  borderRadius: BorderRadius.circular(4.h),
                ),
                child: Center(
                  child: Container(
                    width: 15.h,
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: appTheme.whiteCustom,
                      borderRadius: BorderRadius.circular(2.h),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.h),
              Text(
                rating,
                style: TextStyleHelper.instance.body14MediumInter
                    .copyWith(color: appTheme.colorFF8888),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
