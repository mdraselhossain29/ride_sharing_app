import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_button.dart';
import './widgets/care_recommendation_item.dart';
import './widgets/service_package_item.dart';

class BikeServiceScreen extends StatelessWidget {
  BikeServiceScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> careRecommendations = [
    {
      'image': ImageConstant.imgRectangle334,
      'title': 'Spark Plug',
    },
    {
      'image': ImageConstant.imgRectangle33491x110,
      'title': 'Clutch Shoe',
    },
    {
      'image': ImageConstant.imgRectangle3341,
      'title': 'Hose Fuel',
    },
  ];

  List<Map<String, dynamic>> servicePackages = [
    {
      'image': ImageConstant.imgRectangle3151,
      'title': 'Annual Maintenance',
      'currentPrice': '₹ 900',
      'originalPrice': '₹ 1,000',
      'discount': '10% Off',
    },
    {
      'image': ImageConstant.imgRectangle3152,
      'title': 'Teflon Coating',
      'currentPrice': '₹ 1350',
      'originalPrice': '₹ 1500',
      'discount': '10% Off',
    },
    {
      'image': ImageConstant.imgRectangle3153,
      'title': 'Annual Maintenance',
      'currentPrice': '₹ 900',
      'originalPrice': '₹ 1,000',
      'discount': '10% Off',
    },
    {
      'image': ImageConstant.imgRectangle3154,
      'title': 'Teflon Coating',
      'currentPrice': '₹ 1350',
      'originalPrice': '₹ 1500',
      'discount': '10% Off',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(43.h),
        child: CustomAppBar(
          title: 'Care',
          badgeCount: 3,
          onMenuTap: () {
            print('Menu toggled');
          },
          onSearchTap: () {
            print('Search initiated');
          },
          onCartTap: () {
            print('Cart viewed');
          },
          onFavoritesTap: () {
            print('Favorites viewed');
          },
        ),
      ),
      body: Column(
        children: [
          _buildBikeNameSection(context),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCareRecommendationsSection(context),
                  SizedBox(height: 24.h),
                  _buildServicePackagesSection(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBikeNameSection(BuildContext context) {
    return Container(
      height: 42.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(
        color: appTheme.whiteCustom,
        border: Border(
          bottom: BorderSide(
            color: appTheme.colorFFF3F2,
            width: 3.h,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Bike Name',
            style: TextStyleHelper.instance.body14MediumInter
                .copyWith(color: appTheme.colorFF2222),
          ),
          CustomTextButton(
            text: 'Change',
            onPressed: () {
              print('Change bike name');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCareRecommendationsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Care Recommendations',
              style: TextStyleHelper.instance.title16SemiBoldInter,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('View all recommendations');
                  },
                  child: Text(
                    'View all',
                    style: TextStyleHelper.instance.body14RegularInter,
                  ),
                ),
                SizedBox(width: 4.h),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowright,
                  height: 8.h,
                  width: 4.h,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 126.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: careRecommendations.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.h),
            itemBuilder: (context, index) {
              return CareRecommendationItem(
                image: careRecommendations[index]['image'],
                title: careRecommendations[index]['title'],
                onTap: () {
                  print(
                      'Selected recommendation: ${careRecommendations[index]['title']}');
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildServicePackagesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Buy Service Packages',
              style: TextStyleHelper.instance.title16SemiBoldInter,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('View all packages');
                  },
                  child: Text(
                    'View all',
                    style: TextStyleHelper.instance.body14RegularInter,
                  ),
                ),
                SizedBox(width: 4.h),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowright,
                  height: 8.h,
                  width: 4.h,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.h,
            mainAxisSpacing: 0.h,
            childAspectRatio: 0.99,
          ),
          itemCount: servicePackages.length,
          itemBuilder: (context, index) {
            return ServicePackageItem(
              image: servicePackages[index]['image'],
              title: servicePackages[index]['title'],
              currentPrice: servicePackages[index]['currentPrice'],
              originalPrice: servicePackages[index]['originalPrice'],
              discount: servicePackages[index]['discount'],
              onTap: () {
                print('Selected package: ${servicePackages[index]['title']}');
              },
            );
          },
        ),
      ],
    );
  }
}
