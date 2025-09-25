import 'package:flutter/material.dart';

import '../../functions/constant/appColors.dart';


class ThreeCardsWidget extends StatelessWidget {
  final List<String> titles;
  final List<String> subtitles;
  final List<IconData> icons;

  const ThreeCardsWidget({
    Key? key,
    required this.titles,
    required this.subtitles,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        return Expanded(
          child: Card(
            color: AppColors.clrWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icons[index], size: 40, color: Colors.blue),
                  const SizedBox(height: 10),
                  Text(
                    titles[index],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitles[index],
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
