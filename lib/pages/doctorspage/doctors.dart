import 'package:flutter/material.dart';
import 'package:health_app/functions/constant/appColors.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.clrPrimary1,
        foregroundColor: AppColors.clrWhite,
        title: Text("Register Doctors",
        style: TextStyle(
          color: AppColors.clrWhite,
        ),
        ),
      ),
    );
  }
}
