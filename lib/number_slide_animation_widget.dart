import 'package:flutter/material.dart';

import 'number_col.dart';

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

  /// The formatting style the number will be displayed in
  ///
  /// default to: NumberFormat.none
  final NumberFormatMode format;

  NumberSlideAnimation(
      {@required this.number,
      this.textStyle = const TextStyle(fontSize: 16.0),
      this.duration = const Duration(milliseconds: 1500),
      this.curve = Curves.easeIn,
      this.format = NumberFormatMode.none})
      : assert(int.tryParse(number) != null);

  @override
  _NumberSlideAnimationState createState() => _NumberSlideAnimationState();
}

class _NumberSlideAnimationState extends State<NumberSlideAnimation> {
  double _width = 1000.0;

  GlobalKey _rowKey = new GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(getRowSize().width.toString());
      setState(() {
        _width = getRowSize().width;
      });

      print(_width.toString());
    });
  }

  Size getRowSize() {
    final RenderBox box = _rowKey.currentContext.findRenderObject();
    return box.size;
  }

  isNumeric(String string) => num.tryParse(string) != null;

  String getFormattedNumber(String number, NumberFormatMode mode) {
    if (mode == NumberFormatMode.none) return number;

    final String separator = mode == NumberFormatMode.period ? '.' : ',';
    return number.replaceAllMapped(
      new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}$separator',
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedNumber = getFormattedNumber(widget.number, widget.format);

    return Row(
      mainAxisSize: MainAxisSize.min,
      key: _rowKey,
      children: List.generate(formattedNumber.length, (position) {
        final digit = formattedNumber[position];

        if (isNumeric(digit)) {
          return NumberCol(
            animateTo: int.parse(digit),
            textStyle: widget.textStyle,
            duration: widget.duration,
            curve: widget.curve,
          );
        }

        return Text(digit, style: widget.textStyle);
      }),
    );
  }
}

/// Defines the type of formatting used for the number.
///
/// [none] does not enforce any formatting and will output the number as given.
///
/// [comma] uses "," as the thousand separator e.g. 1,234
///
/// [period] uses "." as the thousand separator e.g. 1.234
enum NumberFormatMode {
  /// No number formatting is used e.g. 1234
  none,

  /// "," will be used as the "thousand" separators e.g. 1,234
  comma,

  /// "." will be used as the "thousand" separators e.g. 1.234
  period,
}
