import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';

class EventCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final List<String> participants;
  final String additionalCount;
  final bool isSpecial;

  EventCardWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.participants,
    required this.additionalCount,
    this.isSpecial = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 144.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 144.h,
            height: 90.h,
            child: Stack(
              children: [
                CustomImageView(
                  imagePath: image,
                  height: 90.h,
                  width: 144.h,
                  fit: BoxFit.cover,
                  radius: BorderRadius.circular(3.h),
                ),
                Positioned(
                  bottom: 8.h,
                  left: 8.h,
                  child: Row(
                    children: [
                      ...participants
                          .take(3)
                          .map((participant) => Padding(
                                padding: EdgeInsets.only(right: 4.h),
                                child: CustomImageView(
                                  imagePath: participant,
                                  height: 28.h,
                                  width: 28.h,
                                  fit: BoxFit.cover,
                                  radius: BorderRadius.circular(14.h),
                                ),
                              ))
                          .toList(),
                      Container(
                        width: 28.h,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: isSpecial
                              ? Color(0xFF183883)
                              : appTheme.colorFF584C,
                          borderRadius: BorderRadius.circular(14.h),
                          border: Border.all(
                              color: appTheme.whiteCustom, width: 1.h),
                        ),
                        child: Center(
                          child: Text(
                            additionalCount,
                            style:
                                TextStyleHelper.instance.body12SemiBoldRoboto,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyleHelper.instance.body14RegularInter
                .copyWith(color: appTheme.colorFF6666),
          ),
        ],
      ),
    );
  }
}
