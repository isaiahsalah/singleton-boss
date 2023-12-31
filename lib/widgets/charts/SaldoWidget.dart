// ignore_for_file: file_names

import 'package:boss/providers/ThemeProvider.dart';
import 'package:boss/resources/AppDimensions.dart';
import 'package:boss/widgets/main/MyCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBalanceWidget extends StatelessWidget {
  final String title;
  final String description;
  final int entryMoney;
  final int exitMoney;
  const MyBalanceWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.entryMoney,
    required this.exitMoney,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider watchTheme = context.watch<ThemeProvider>();
    return MyCardWidget(
      header: true,
      title: title,
      description: description,
      footer: false,
      widgetContend: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                (entryMoney + exitMoney).toString(),
                style: const TextStyle(
                    fontSize: 40, fontWeight: FontWeight.bold, height: 0),
              ),
              const SizedBox(width: 4),
              const Text(
                "Bs.",
                style: TextStyle(
                  height: 3.9,
                ),
              ),
            ],
          ),
          Card(
            color: const Color(0xff627B8E),
            surfaceTintColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacingSmall),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  transaction("Ingresos", entryMoney, true),
                  SizedBox(
                    height: 60,
                    child: VerticalDivider(
                      thickness: 2.5,
                      color: watchTheme.colors.primary,
                    ),
                  ),
                  transaction("Egresos", exitMoney, false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget transaction(String title, int money, bool entry) {
  return Expanded(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            entry
                ? const Icon(
                    Icons.arrow_upward_rounded,
                    color: Color(0xff9EDBA2),
                  )
                : const Icon(
                    Icons.arrow_downward_rounded,
                    color: Color(0xffEF927F),
                  ),
            Text(
              title,
              style: const TextStyle(height: 2.3, color: Color(0xffA7B5BF)),
            ),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              money.toString(),
              style: const TextStyle(
                fontSize: 25,
                height: 0,
              ),
            ),
            const SizedBox(width: 2),
            const Text(
              "Bs.",
              style: TextStyle(
                fontSize: 12,
                height: 2.3,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
