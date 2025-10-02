import 'drawer_item.dart';
import 'package:flutter/material.dart';

/// Doctor’s Drawer Items
final doctorItems = [

  DrawerItem(title: 'Patients', icon: Icons.people),
  DrawerItem(title: 'Appointments', icon: Icons.calendar_today),
  DrawerItem(title: 'Prescriptions', icon: Icons.medical_services),
  DrawerItem(title: 'Lab Results', icon: Icons.biotech),
];

/// Patient’s Drawer Items
final patientItems = [

  DrawerItem(title: 'My Appointments', icon: Icons.event_note),
  DrawerItem(title: 'Prescriptions', icon: Icons.receipt_long),
  DrawerItem(title: 'Lab Reports', icon: Icons.biotech),
  DrawerItem(title: 'Payments', icon: Icons.attach_money),
];

/// Admin / Director (Hospital Director)
final directorItems = [
  DrawerItem(title: 'Doctors', icon: Icons.person),
  DrawerItem(title: 'Patients', icon: Icons.people),
  DrawerItem(title: 'Appointments', icon: Icons.schedule),
  DrawerItem(title: 'Billing & Payments', icon: Icons.attach_money),
  DrawerItem(title: 'Inventory & Pharmacy', icon: Icons.local_hospital),
  DrawerItem(title: 'Reports', icon: Icons.insert_chart),
];

/// Common items (bottom of drawer)
final itemsSecond = [
  DrawerItem(title: 'Account', icon: Icons.account_circle),
  DrawerItem(title: 'Settings', icon: Icons.settings),
  DrawerItem(title: 'Help & Support', icon: Icons.help_outline),
];

