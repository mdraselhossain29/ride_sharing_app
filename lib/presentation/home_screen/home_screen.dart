import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import './widgets/event_card_widget.dart';
import './widgets/nearby_user_item.dart';
import './widgets/product_card_widget.dart';
import './widgets/service_card_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> nearbyUsers = [
    {'name': 'Ankita', 'avatar': ImageConstant.imgEllipse40},
    {'name': 'Pankaj', 'avatar': ImageConstant.imgEllipse41},
    {
      'name': 'Manish',
      'avatar': ImageConstant.imgEllipse42,
      'overlay': ImageConstant.imgEllipse49
    },
    {'name': 'Suresh', 'avatar': ImageConstant.imgEllipse43},
    {'name': 'Ankur', 'avatar': ImageConstant.imgEllipse44},
    {'name': 'Deepesh', 'avatar': ImageConstant.imgEllipse45},
    {'name': 'Jaideep', 'avatar': ImageConstant.imgEllipse46},
  ];

  List<Map<String, dynamic>> products = [
    {
      'image': ImageConstant.imgRectangle315,
      'title': 'Racing Dual Visor Helmet',
      'price': '₹ 4,079',
      'originalPrice': '₹ 5,099',
      'discount': '20% Off',
      'rating': '4.8(212)'
    },
    {
      'image': ImageConstant.imgRectangle315110x173,
      'title': 'Aerodynamic Helmet',
      'price': '₹ 2,799',
      'originalPrice': '₹ 3,499',
      'discount': '20% Off',
      'rating': '4.5(154)'
    },
  ];

  List<Map<String, dynamic>> events = [
    {
      'image': ImageConstant.imgRectangle172,
      'title': 'Shimla to Manali',
      'participants': [
        ImageConstant.imgEllipse4028x28,
        ImageConstant.imgEllipse4128x28,
        ImageConstant.imgEllipse4928x28
      ],
      'additionalCount': '+12'
    },
    {
      'image': ImageConstant.imgRectangle173,
      'title': 'Goa to Gujarat',
      'participants': [
        ImageConstant.imgEllipse4028x28,
        ImageConstant.imgEllipse4128x28,
        ImageConstant.imgEllipse4928x28
      ],
      'additionalCount': '+20'
    },
    {
      'image': ImageConstant.imgRectangle174,
      'title': 'Kashmir Trip',
      'participants': [
        ImageConstant.imgEllipse4028x28,
        ImageConstant.imgEllipse4128x28,
        ImageConstant.imgEllipse4928x28
      ],
      'additionalCount': '+6'
    },
    {
      'image': ImageConstant.imgRectangle175,
      'title': 'Kashmir Trip',
      'participants': [
        ImageConstant.imgEllipse4028x28,
        ImageConstant.imgEllipse4128x28,
        ImageConstant.imgEllipse4928x28
      ],
      'additionalCount': '+9',
      'isSpecial': true
    },
  ];

  List<Map<String, dynamic>> services = [
    {
      'image': ImageConstant.imgRectangle3151,
      'title': 'Annual Maintenance',
      'price': '₹ 900',
      'originalPrice': '₹ 1,000',
      'discount': '10% Off'
    },
    {
      'image': ImageConstant.imgRectangle3152,
      'title': 'Teflon Coating',
      'price': '₹ 1350',
      'originalPrice': '₹ 1500',
      'discount': '10% Off'
    },
    {
      'image': ImageConstant.imgRectangle3153,
      'title': 'Annual Maintenance',
      'price': '₹ 900',
      'originalPrice': '₹ 1,000',
      'discount': '10% Off'
    },
    {
      'image': ImageConstant.imgRectangle3154,
      'title': 'Teflon Coating',
      'price': '₹ 1350',
      'originalPrice': '₹ 1500',
      'discount': '10% Off'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(43.h),
        child: CustomAppBar(
          title: 'Home',
          onMenuTap: () {},
          onSearchTap: () {},
          onCartTap: () {},
          onFavoritesTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNearbyUsersSection(),
            SizedBox(height: 24.h),
            _buildDealsOfTheDaySection(),
            SizedBox(height: 24.h),
            _buildUpcomingEventsSection(),
            SizedBox(height: 24.h),
            _buildServicePackagesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildNearbyUsersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nearby Users',
              style: TextStyleHelper.instance.title16SemiBoldInter,
            ),
            Row(
              children: [
                Text(
                  'View all',
                  style: TextStyleHelper.instance.body14RegularInter,
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
          height: 88.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: nearbyUsers.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.h),
            itemBuilder: (context, index) {
              if (index == nearbyUsers.length - 2 &&
                  index == nearbyUsers.length - 1) {
                return Row(
                  children: [
                    NearbyUserItem(
                      name: nearbyUsers[index]['name'] ?? '',
                      avatar: nearbyUsers[index]['avatar'] ?? '',
                      overlay: nearbyUsers[index]['overlay'],
                    ),
                    SizedBox(width: 16.h),
                    NearbyUserItem(
                      name: nearbyUsers[index + 1]['name'] ?? '',
                      avatar: nearbyUsers[index + 1]['avatar'] ?? '',
                      overlay: nearbyUsers[index + 1]['overlay'],
                    ),
                  ],
                );
              } else if (index < nearbyUsers.length - 2) {
                return NearbyUserItem(
                  name: nearbyUsers[index]['name'] ?? '',
                  avatar: nearbyUsers[index]['avatar'] ?? '',
                  overlay: nearbyUsers[index]['overlay'],
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDealsOfTheDaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Deals of the Day',
              style: TextStyleHelper.instance.title16SemiBoldInter,
            ),
            Row(
              children: [
                Text(
                  'View all',
                  style: TextStyleHelper.instance.body14RegularInter,
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
        SizedBox(height: 10.h),
        SizedBox(
          height: 240.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.h),
            itemBuilder: (context, index) {
              return ProductCardWidget(
                image: products[index]['image'] ?? '',
                title: products[index]['title'] ?? '',
                price: products[index]['price'] ?? '',
                originalPrice: products[index]['originalPrice'] ?? '',
                discount: products[index]['discount'] ?? '',
                rating: products[index]['rating'] ?? '',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUpcomingEventsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming Events',
              style: TextStyleHelper.instance.title16SemiBoldInter,
            ),
            Row(
              children: [
                Text(
                  'View all',
                  style: TextStyleHelper.instance.body14RegularInter,
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
          height: 120.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.h),
            itemBuilder: (context, index) {
              return EventCardWidget(
                image: events[index]['image'] ?? '',
                title: events[index]['title'] ?? '',
                participants:
                    List<String>.from(events[index]['participants'] ?? []),
                additionalCount: events[index]['additionalCount'] ?? '',
                isSpecial: events[index]['isSpecial'] ?? false,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildServicePackagesSection() {
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
                Text(
                  'View all',
                  style: TextStyleHelper.instance.body14RegularInter,
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
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ServiceCardWidget(
                    image: services[0]['image'] ?? '',
                    title: services[0]['title'] ?? '',
                    price: services[0]['price'],
                    originalPrice: services[0]['originalPrice'],
                    discount: services[0]['discount'],
                  ),
                ),
                SizedBox(width: 16.h),
                Expanded(
                  child: ServiceCardWidget(
                    image: services[1]['image'] ?? '',
                    title: services[1]['title'] ?? '',
                    price: services[1]['price'],
                    originalPrice: services[1]['originalPrice'],
                    discount: services[1]['discount'],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: ServiceCardWidget(
                    image: services[2]['image'] ?? '',
                    title: services[2]['title'] ?? '',
                    price: services[2]['price'],
                    originalPrice: services[2]['originalPrice'],
                    discount: services[2]['discount'],
                  ),
                ),
                SizedBox(width: 16.h),
                Expanded(
                  child: ServiceCardWidget(
                    image: services[3]['image'] ?? '',
                    title: services[3]['title'] ?? '',
                    price: services[3]['price'],
                    originalPrice: services[3]['originalPrice'],
                    discount: services[3]['discount'],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
