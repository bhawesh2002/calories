import 'package:calories/home/widgets/bar_candle.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  const BarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHt = constraints.maxHeight;
        return SizedBox(
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: SizedBox(
                  height: maxHt * 0.5,
                  child: BarCandle(
                    title: "10",
                    subtitle: " /46 g Fat",
                    completed: 0.25,
                    color: Color(0xffADCB3D),
                    animate: true,
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: maxHt * 0.70,
                  child: BarCandle(
                    title: "34",
                    subtitle: " /69 g Fat",
                    completed: 0.48,
                    color: Color(0xffFF7617),
                    animate: true,
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: maxHt * 0.95,
                  child: BarCandle(
                    title: "76",
                    subtitle: " /120 g Fat",
                    completed: 0.8,
                    color: Color(0xffFFA7E7),
                    animate: true,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
