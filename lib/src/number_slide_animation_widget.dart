import 'package:flutter/material.dart';

import 'src/../number_col.dart';

/// This widget will display the provided [number] given in the constructor
///
/// It will be displayed shortly after a neat transition in which each number
/// slides into its place
class NumberSlideAnimation extends StatefulWidget {
  /// The number that should be displayed
  ///
  /// It should fit following constraints:
  ///
  /// number != null
  /// number should contain ONLY of numeric values
  final String number;

  /// The TextStyle of each number tile
  ///
  /// defaults to: TextStyle(fontSize: 16.0)
  final TextStyle textStyle;

  /// The duration of the whole animation
  ///
  /// defaults to: const Duration(milliseconds: 1500)
  final Duration duration;

  /// The Curve in which the animation is displayed
  ///
  /// defaults to: Curves.easeIn
  final Curve curve;

  NumberSlideAnimation({
    required this.number,
    this.textStyle = const TextStyle(fontSize: 16.0),
    this.duration = const Duration(milliseconds: 1500),
    this.curve = Curves.easeIn,
  }) : assert(int.tryParse(number) != null);

  @override
  _NumberSlideAnimationState createState() => _NumberSlideAnimationState();
}

class _NumberSlideAnimationState extends State<NumberSlideAnimation> {
  double _width = 1000.0;

  GlobalKey _rowKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print(getRowSize().width.toString());
      setState(() {
        _width = getRowSize().width;
      });

      print(_width.toString());
    });
  }

  Size getRowSize() {
    final RenderBox box =
        _rowKey.currentContext!.findRenderObject() as RenderBox;
    return box.size;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      key: _rowKey,
      children: List.generate(widget.number.length, (position) {
        return NumberCol(
          animateTo: int.parse(widget.number[position]),
          textStyle: widget.textStyle,
          duration: widget.duration,
          curve: widget.curve,
        );
      }),
    );
  }
}
