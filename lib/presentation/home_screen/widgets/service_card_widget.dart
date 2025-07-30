import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';

class ServiceCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String? price;
  final String? originalPrice;
  final String? discount;

  ServiceCardWidget({
    Key? key,
    required this.image,
    required this.title,
    this.price,
    this.originalPrice,
    this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: image,
          height: 110.h,
          width: double.infinity,
          fit: BoxFit.cover,
          radius: BorderRadius.circular(4.h),
        ),
        if (price != null) ...[
          SizedBox(height: 12.h),
          Text(
            title,
            style: TextStyleHelper.instance.body14MediumInter,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                price ?? '',
                style: TextStyleHelper.instance.title16SemiBoldInter,
              ),
              SizedBox(width: 8.h),
              if (originalPrice != null)
                Text(
                  originalPrice!,
                  style: TextStyleHelper.instance.body12RegularInter
                      .copyWith(decoration: TextDecoration.lineThrough),
                ),
              SizedBox(width: 8.h),
              if (discount != null)
                Text(
                  discount!,
                  style: TextStyleHelper.instance.body12RegularInter
                      .copyWith(color: appTheme.colorFF584C),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
