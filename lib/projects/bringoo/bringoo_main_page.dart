import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:portfolio/projects/bringoo/pages/account_page.dart';
import 'package:portfolio/projects/bringoo/pages/home_page.dart';
import 'package:portfolio/projects/bringoo/pages/job_list_page.dart';
import 'package:portfolio/projects/bringoo/pages/products_page.dart';
import 'package:portfolio/projects/bringoo/widgets/bringoo_navigationbar.dart';
import 'package:portfolio/themes/bringoo_colors.dart';

class BringooMainPage extends StatefulWidget {
  const BringooMainPage({super.key});

  @override
  State<BringooMainPage> createState() => _BringooMainPageState();
}

class _BringooMainPageState extends State<BringooMainPage> {
  final PersistentTabController _bottomBarViewController =
      PersistentTabController(initialIndex: 0);

  Color getIconColor(int index) {
    if (_bottomBarViewController.index == index) {
      return BringooColors.primary;
    } else {
      return BringooColors.neutral.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      onTabChanged: (value) {
        setState(() {});
      },
      controller: _bottomBarViewController,
      tabs: [
        PersistentTabConfig(
          screen: HomePage(),
          item: ItemConfig(
            activeForegroundColor: BringooColors.primary,
            inactiveForegroundColor: BringooColors.neutral.shade400,
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: getIconColor(0),
            ),
            title: 'Home',
          ),
        ),
        PersistentTabConfig(
          screen: JobListPage(),
          item: ItemConfig(
            activeForegroundColor: BringooColors.primary,
            inactiveForegroundColor: BringooColors.neutral.shade400,
            icon: SvgPicture.asset(
              'assets/icons/brief_case.svg',
              color: getIconColor(1),
            ),
            title: 'Job List',
          ),
        ),
        PersistentTabConfig(
          screen: ProductsPage(),
          item: ItemConfig(
            activeForegroundColor: BringooColors.primary,
            inactiveForegroundColor: BringooColors.neutral.shade400,
            icon: SvgPicture.asset(
              'assets/icons/archive_box.svg',
              color: getIconColor(2),
            ),
            title: 'Products',
          ),
        ),
        PersistentTabConfig(
          screen: AccountPage(),
          item: ItemConfig(
            activeForegroundColor: BringooColors.primary,
            inactiveForegroundColor: BringooColors.neutral.shade400,
            icon: SvgPicture.asset(
              'assets/icons/main_person.svg',
              color: getIconColor(3),
            ),
            title: 'Account',
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) {
        return BringooNavbarWidget(
          items: navBarConfig.items,
          onItemSelected: navBarConfig.onItemSelected,
          selectedIndex: navBarConfig.selectedIndex,
        );
      },
    );
  }
}
