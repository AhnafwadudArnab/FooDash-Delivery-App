
import 'package:FooDash_App/Pages/Home_pages/Utility/SideXbar/Order_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../Downbar/BottomNavigationButtons.dart';
import '../../Downbar/ProfileBar/Profilebar.dart';
import 'SideXbar/Address_page.dart';
import 'SideXbar/Favourite_page.dart';
import 'SideXbar/Offers.dart';
import 'SideXbar/Rewards.dart';
import 'SideXbar/SettingsBar.dart';
import 'SideXbar/Vip_bannar_page.dart';
import 'SideXbar/help_center_page.dart';
import 'SideXbar/invite_friends_page.dart';

class SideBarXExample extends StatelessWidget {
  const SideBarXExample({super.key, required SidebarXController controller})
      : _controller = controller;
  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: const SidebarXTheme(
        decoration: BoxDecoration(
          //background color//
            color: canvasColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
        iconTheme: IconThemeData(
          color: Colors.white,//icon color//
        ),
        selectedTextStyle: TextStyle(color: Colors.white),
      ),
      extendedTheme: const SidebarXTheme(width: 250),
      footerDivider: Divider(color: Colors.white.withOpacity(0.8), height: 1),
      headerBuilder: (context, extended) {
        return const SizedBox(
          height: 160,
          child: Icon(
            Icons.person,
            size: 80,
            color: Colors.grey,
          ),
        );
      },

      items: [
        SidebarXItem(

          icon: Icons.admin_panel_settings_rounded,
          label: 'Admin',
          onTap: () {
            Get.offAll(() => const ProfilePage());
          },
        ),
        SidebarXItem(
          icon: Icons.access_time_filled,
          label: 'Become a VIP!',
          onTap: () {
            Get.offAll(() => const BecomeVipPage());
          },
        ),
        SidebarXItem(
          icon: Icons.local_offer,
          label: 'Offers',
          onTap: () {
            Get.offAll(() => OfferPage());
          },
        ),
        SidebarXItem(
          icon: Icons.card_giftcard,
          label: 'Vouchers',
          onTap: () {
            Get.offAll(() => OfferPage());
          },
        ),
        SidebarXItem(
          icon: Icons.favorite,
          label: 'Favorites',
          onTap: () {
            Get.offAll(() => const FavouritesScreen());
          },
        ),
        SidebarXItem(
          icon: Icons.list_alt,
          label: 'Past Orders',
          onTap: () {
            Get.offAll(() => const OrdersScreen());
          },
        ),
        SidebarXItem(
          icon: Icons.location_on,
          label: 'Addresses',
          onTap: () {
            Get.to(()=>const AddressPage());
          },
        ),
        SidebarXItem(
          icon: Icons.star,
          label: 'Rewards',
          onTap: () {
            Get.to(()=>const RewardsPage());
          },
        ),
        SidebarXItem(
          icon: Icons.help,
          label: 'Help-center',
          onTap: () {
            Get.to(()=>const HelpCenterPage());
          },
        ),
        SidebarXItem(
          icon: Icons.person_add,
          label: 'Invite friends',
          onTap: () {
            Get.to(()=>const InviteFriendsPage());
          },
        ),
        SidebarXItem(
          icon: Icons.settings,
          label: 'Settings',
          onTap: () {
            Get.offAll(() =>  const Settings_page());
          },
        ),
      ],
    );
  }
}
