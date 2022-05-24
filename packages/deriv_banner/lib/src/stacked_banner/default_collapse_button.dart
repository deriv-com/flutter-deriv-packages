import 'package:flutter/material.dart';

/// The default collapse button which is shown in the bottom of stacked banner
/// list when it's expanded.
class DefaultCollapseButton extends StatelessWidget {
  /// Initializes [DefaultCollapseButton].
  const DefaultCollapseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xFF0E0E0E),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color.fromRGBO(255, 255, 255, 0.08),
          ),
          alignment: Alignment.center,
          height: 32,
          child: Text(
              'SHOW LESS',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
        ),
      );
}
