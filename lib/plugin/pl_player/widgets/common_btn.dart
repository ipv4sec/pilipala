import 'package:flutter/material.dart';
import 'package:pilipala/utils/tv.dart';

class ComBtn extends StatelessWidget {
  final Widget? icon;
  final Function? fuc;

  const ComBtn({
    this.icon,
    this.fuc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double size = isTV ? 48.0 : 34.0;
    return SizedBox(
      width: size,
      height: size,
      child: IconButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          // TV 焦点高亮
          focusColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return Theme.of(context).colorScheme.primary.withOpacity(0.15);
              }
              if (states.contains(MaterialState.hovered)) {
                return Theme.of(context).colorScheme.primary.withOpacity(0.08);
              }
              return null;
            },
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: Colors.transparent,
                width: 2,
              ),
            ),
          ),
        ),
        onPressed: () {
          fuc!();
        },
        icon: icon!,
      ),
    );
  }
}
