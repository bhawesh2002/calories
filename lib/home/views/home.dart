import 'package:calories/home/widgets/bar_chart.dart';
import 'package:calories/utils/app_spacing.dart';
import 'package:calories/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sficon/flutter_sficon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.devicePadding(
        context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appLocale.greeting,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            AppSpacing.v14,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appLocale.startHealthyDay,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                CircleAvatar(
                  radius: context.deviceWt * 0.055,
                  backgroundColor: Colors.amber,
                ),
              ],
            ),
            Expanded(child: BarChart()),
            AppSpacing.v30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    text: "350",
                    style: TextStyle(
                      fontSize: context.deviceWt * 0.165,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: " /1045",
                        style: TextStyle(
                          fontSize: context.deviceWt * 0.05,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  appLocale.kcalLeft,
                  style: TextStyle(
                    fontSize: context.deviceWt * 0.05,
                    fontWeight: FontWeight.w600,
                    height: 2.4,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SFIcon(SFIcons.sf_person, fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SFIcon(SFIcons.sf_fork_knife, fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SFIcon(
                      SFIcons.sf_plus,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    style: IconButton.styleFrom(backgroundColor: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SFIcon(SFIcons.sf_dumbbell, fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SFIcon(SFIcons.sf_chart_bar_xaxis, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
