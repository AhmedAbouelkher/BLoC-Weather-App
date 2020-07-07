import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveProgessIndicator extends StatelessWidget {
  final double strockWidth;
  final double value;
  final Animation<Color> valueColor;
  final double cupetinoRadius;
  const AdaptiveProgessIndicator({
    Key key,
    this.strockWidth,
    this.value,
    this.valueColor,
    this.cupetinoRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    if (isIOS) {
      return CupertinoActivityIndicator(
        radius: cupetinoRadius ?? 13.0,
      );
    }
    return CircularProgressIndicator(
      strokeWidth: strockWidth ?? 4.0,
      value: value,
      valueColor: valueColor,
    );
  }
}
