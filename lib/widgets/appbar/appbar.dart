import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 70,
      titleSpacing: 0,
      title: Row(
        children: [
          SizedBox(width: 8),
          // ClipOval(
          //   child: Image.asset(
          //     'assets/1.jpg',
          //     height: 35,
          //     width: 35,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.black),
          onPressed: () {},
        ),
        TextButton.icon(
          onPressed: () {
            print('should open user profile');
          },
          icon: Icon(Icons.person, color: Colors.black),
          label: Text(
            'John Doe',
            style: TextStyle(color: Colors.black),
          ),
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
