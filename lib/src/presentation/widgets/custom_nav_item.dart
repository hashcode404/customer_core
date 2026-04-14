import 'package:flutter/material.dart';
import 'package:customer_core/src/core/theme/app_colors.dart';
import 'package:customer_core/src/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

class CustomNavItem extends StatelessWidget {
  final bool selected;
  final LottieGenImage icon;
  final String label;
  final VoidCallback onTap;
  final Color activeColor;
  final Color inactiveColor;

  const CustomNavItem({
    super.key,
    required this.selected,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top indicator
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 1.5,
              // width: selected ? null : 0,
              margin: const EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                color: selected ? activeColor : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            // Icon(
            //   icon,
            //   color: selected ? activeColor : inactiveColor,
            // ),
            AnimatedLottieIcon(
              selected: selected,
              asset: icon,
              size: 30,
            ),

            const SizedBox(height: 4),

            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: selected ? activeColor : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedLottieIcon extends StatefulWidget {
  final bool selected;
  final LottieGenImage asset;
  final double size;

  const AnimatedLottieIcon({
    super.key,
    required this.selected,
    required this.asset,
    this.size = 30,
  });

  @override
  State<AnimatedLottieIcon> createState() => _AnimatedLottieIconState();
}

class _AnimatedLottieIconState extends State<AnimatedLottieIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void didUpdateWidget(covariant AnimatedLottieIcon oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Replay animation whenever selected becomes true again
    if (widget.selected && !oldWidget.selected) {
      _controller.forward(from: 0);
    }

    // If user taps again on selected item:
    if (widget.selected && oldWidget.selected) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.asset.lottie(
      controller: _controller,
      height: widget.size,
      delegates: LottieDelegates(
        values: [
          ValueDelegate.color(
            const ['**'],
            value: widget.selected ? AppColors.kPrimaryColor : Colors.grey,
          ),
          ValueDelegate.strokeColor(
            const ['**'],
            value: widget.selected ? AppColors.kPrimaryColor : Colors.grey,
          ),
        ],
      ),
      onLoaded: (composition) {
        _controller.duration = composition.duration;
      },
    );
  }
}
