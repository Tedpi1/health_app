import 'package:flutter/material.dart';
import 'package:health_app/widgets/sidebar/drawer_item.dart';
import 'package:health_app/widgets/sidebar/drawer_items.dart';
import 'package:health_app/widgets/sidebar/navigation_provider.dart';
import 'package:provider/provider.dart';

import '../pages/authpage/login.dart';
import '../../functions/constant/appColors.dart';
import '../pages/doctorspage/doctors.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final int role; // 1=Director, 2=Student, 3=Teacher

  const NavigationDrawerWidget({Key? key, required this.role}) : super(key: key);

  List<DrawerItem> getRoleItems(int role) {
    switch (role) {
      case 1: // Hospital Director / Admin
        return directorItems;
      case 2: // Doctor
        return doctorItems;
      case 3: // Patient
        return patientItems;
      default:
        return [];
    }
  }


  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final safeArea = EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);
    final provider = Provider.of<NavigationProvider>(context);
    final isCollapsed = provider.isCollapsed;
    final roleItems = getRoleItems(role);

    return Drawer(
      child: Container(
        color: AppColors.bgBlack50,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 24).add(safeArea),
                width: double.infinity,
                color: AppColors.background,
                child: buildHeader(isCollapsed),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      buildList(items: roleItems, isCollapsed: isCollapsed),
                      const SizedBox(height: 24),
                      Divider(color: AppColors.clrBlack),
                      const SizedBox(height: 16),
                      buildList(
                        indexOffset: roleItems.length,
                        items: itemsSecond,
                        isCollapsed: isCollapsed,
                      ),
                    ],
                  ),
                ),
              ),
              buildCollapsedIcon(context, isCollapsed),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList({
    required bool isCollapsed,
    required List<DrawerItem> items,
    int indexOffset = 0,
  }) =>
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = items[index];
          return buildMenuItem(
            isCollapsed: isCollapsed,
            text: item.title,
            icon: item.icon,
            onClicked: () => selectedItem(context, indexOffset + index),
          );
        },
      );

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    if(role==1){
      switch(index){
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (_) => DoctorsPage()));
          break;

      }
    }
  }

  Widget buildHeader(bool isCollapsed) => isCollapsed
      ? const FlutterLogo(size: 48)
      : Row(
    children: const [
      SizedBox(width: 24),
      FlutterLogo(size: 48),
      SizedBox(width: 12),
      Text(
        'School Logo',
        style: TextStyle(fontSize: 28, color: Colors.white),
      ),
    ],
  );

  Widget buildMenuItem({
    required bool isCollapsed,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = AppColors.clrBlack;
    final leading = Icon(icon, color: color);
    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: leading,
        title: isCollapsed ? null : Text(text, style: TextStyle(color: color)),
        onTap: onClicked,
      ),
    );
  }

  Widget buildCollapsedIcon(BuildContext context, bool isCollapsed) {
    final double size = 52;
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : const EdgeInsets.only(right: 16);
    final width = isCollapsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: AppColors.bgBlack50,
        child: InkWell(
          child: SizedBox(
            width: width,
            height: size,
            child: Icon(icon, color: AppColors.clrBlack),
          ),
          onTap: () {
            Provider.of<NavigationProvider>(context, listen: false).toggleCollapsed();
          },
        ),
      ),
    );
  }
}
