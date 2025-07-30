import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * Custom AppBar component with menu, title, and action icons including cart with badge
 * 
 * Features:
 * - Menu/hamburger icon on the left
 * - Dynamic title text
 * - Search, cart (with badge), and favorites icons on the right
 * - Purple background theme
 * - Configurable badge count and callbacks
 * 
 * @param title - The title text to display in the center
 * @param badgeCount - Number to show in the cart badge
 * @param showBadge - Whether to show the cart badge
 * @param onMenuTap - Callback when menu icon is tapped
 * @param onSearchTap - Callback when search icon is tapped  
 * @param onCartTap - Callback when cart icon is tapped
 * @param onFavoritesTap - Callback when favorites icon is tapped
 */
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.badgeCount,
    this.showBadge,
    this.onMenuTap,
    this.onSearchTap,
    this.onCartTap,
    this.onFavoritesTap,
  }) : super(key: key);

  /// The title text to display in the center of the app bar
  final String? title;

  /// Number to display in the cart badge
  final int? badgeCount;

  /// Whether to show the cart badge
  final bool? showBadge;

  /// Callback function when menu icon is tapped
  final VoidCallback? onMenuTap;

  /// Callback function when search icon is tapped
  final VoidCallback? onSearchTap;

  /// Callback function when cart icon is tapped
  final VoidCallback? onCartTap;

  /// Callback function when favorites icon is tapped
  final VoidCallback? onFavoritesTap;

  @override
  Size get preferredSize => Size.fromHeight(43.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appTheme.colorFF584C,
      elevation: 0,
      toolbarHeight: 43.h,
      leading: GestureDetector(
        onTap: onMenuTap,
        child: Container(
          padding: EdgeInsets.all(8.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgFrame23,
            height: 22.h,
            width: 26.h,
          ),
        ),
      ),
      title: Text(
        title ?? "Home",
        style: TextStyleHelper.instance.title16SemiBoldInter
            .copyWith(color: appTheme.whiteCustom, height: 1.25),
      ),
      centerTitle: false,
      titleSpacing: 8.h,
      actions: [
        _buildActionIcons(),
        SizedBox(width: 16.h),
      ],
    );
  }

  /// Builds the action icons section with search, cart, and favorites
  Widget _buildActionIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Search Icon
        GestureDetector(
          onTap: onSearchTap,
          child: Container(
            padding: EdgeInsets.all(4.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgSearch,
              height: 15.h,
              width: 15.h,
            ),
          ),
        ),
        SizedBox(width: 16.h),

        // Cart Icon with Badge
        GestureDetector(
          onTap: onCartTap,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(4.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgSearchWhiteA700,
                  height: 17.h,
                  width: 17.h,
                ),
              ),
              if (showBadge ?? true)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 13.h,
                    width: 12.h,
                    decoration: BoxDecoration(
                      color: appTheme.colorFFFF46,
                      borderRadius: BorderRadius.circular(6.h),
                    ),
                    child: Center(
                      child: Text(
                        (badgeCount ?? 3).toString(),
                        style: TextStyleHelper.instance.label9SemiBoldInter
                            .copyWith(height: 1.22),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(width: 16.h),

        // Favorites Icon
        GestureDetector(
          onTap: onFavoritesTap,
          child: Container(
            padding: EdgeInsets.all(4.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgVector15,
              height: 19.h,
              width: 17.h,
            ),
          ),
        ),
      ],
    );
  }
}
