import 'package:flutter/widgets.dart';

import 'responsive_text_style.dart';

/// A widget that displays text with a [ResponsiveTextStyle].
///
/// The actual [TextStyle] applied to the text will change based on the
/// current screen size, as determined by the [ResponsiveTextStyle.getResponsiveTextStyle] method.
class ResponsiveText extends StatelessWidget {
  final String _text;
  final ResponsiveTextStyle _style;
  final TextAlign _textAlign;
  final TextDirection? _textDirection;
  final Locale? _locale;
  final bool? _softWrap;
  final TextOverflow? _overflow;
  final double? _textScaleFactor;
  final int? _maxLines;
  final String? _semanticsLabel;
  final TextWidthBasis? _textWidthBasis;
  final TextHeightBehavior? _textHeightBehavior;
  final Color? _selectionColor;

  /// Creates a [ResponsiveText] widget.
  const ResponsiveText({
    super.key,
    required String text,
    required ResponsiveTextStyle style,
    TextAlign textAlign = TextAlign.left,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
  })  : _text = text,
        _style = style,
        _textAlign = textAlign,
        _textDirection = textDirection,
        _locale = locale,
        _softWrap = softWrap,
        _overflow = overflow,
        _textScaleFactor = textScaleFactor,
        _maxLines = maxLines,
        _semanticsLabel = semanticsLabel,
        _textWidthBasis = textWidthBasis,
        _textHeightBehavior = textHeightBehavior,
        _selectionColor = selectionColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: _textAlign,
      style: _style.getResponsiveTextStyle(),
      textDirection: _textDirection,
      locale: _locale,
      softWrap: _softWrap,
      overflow: _overflow,
      textScaleFactor: _textScaleFactor,
      maxLines: _maxLines,
      semanticsLabel: _semanticsLabel,
      textWidthBasis: _textWidthBasis,
      textHeightBehavior: _textHeightBehavior,
      selectionColor: _selectionColor,
    );
  }
}
