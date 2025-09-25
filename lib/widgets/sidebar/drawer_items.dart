import 'drawer_item.dart';
import 'package:flutter/material.dart';

final teacherItems = [
  DrawerItem(title: 'Dashboard', icon: Icons.dashboard),
  DrawerItem(title: 'Students', icon: Icons.school),
  DrawerItem(title: 'Attendance', icon: Icons.check_circle),
  DrawerItem(title: 'Exams & Grades', icon: Icons.assignment_turned_in),
];

final studentItems = [
  DrawerItem(title: 'Dashboard', icon: Icons.dashboard),
  DrawerItem(title: 'Classes & Timetable', icon: Icons.schedule),
  DrawerItem(title: 'Exams & Grades', icon: Icons.assignment_turned_in),
  DrawerItem(title: 'Fees & Payments', icon: Icons.attach_money),
];

final directorItems = [
  DrawerItem(title: 'Dashboard', icon: Icons.dashboard),
  DrawerItem(title: 'Students', icon: Icons.school),
  DrawerItem(title: 'Teachers', icon: Icons.person),
  DrawerItem(title: 'Classes & Timetable', icon: Icons.schedule),
  DrawerItem(title: 'Exams & Grades', icon: Icons.assignment_turned_in),
  DrawerItem(title: 'Attendance', icon: Icons.check_circle),
  DrawerItem(title: 'Fees & Payment', icon: Icons.attach_money),
];

final itemsSecond = [
  DrawerItem(title: 'Account', icon: Icons.account_circle),
  DrawerItem(title: 'Settings', icon: Icons.settings),
];
