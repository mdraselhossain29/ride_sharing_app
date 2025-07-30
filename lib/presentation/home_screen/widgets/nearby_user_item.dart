import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';

class NearbyUserItem extends StatelessWidget {
  final String name;
  final String avatar;
  final String? overlay;

  NearbyUserItem({
    Key? key,
    required this.name,
    required this.avatar,
    this.overlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 54.h,
          height: 54.h,
          child: Stack(
            children: [
              CustomImageView(
                imagePath: avatar,
                height: 54.h,
                width: 54.h,
                fit: BoxFit.cover,
                radius: BorderRadius.circular(27.h),
              ),
              if (overlay != null)
                CustomImageView(
                  imagePath: overlay!,
                  height: 54.h,
                  width: 54.h,
                  fit: BoxFit.cover,
                  radius: BorderRadius.circular(27.h),
                ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          name,
          style: TextStyleHelper.instance.body13RegularInter,
        ),
      ],
    );
  }
}
