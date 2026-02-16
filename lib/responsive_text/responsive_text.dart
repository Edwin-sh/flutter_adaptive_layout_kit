import 'package:flutter/widgets.dart';

import 'responsive_text_style.dart';

/// A widget that displays text with a [ResponsiveTextStyle].
///
/// The actual [TextStyle] applied to the text will change based on the
/// current screen size, as determined by the [ResponsiveTextStyle.getResponsiveTextStyle] method.
class ResponsiveText extends Text {
  final String _data;
  final ResponsiveTextStyle _style;
  final TextAlign _textAlign;
  final TextDirection? _textDirection;
  final Locale? _locale;
  final bool? _softWrap;
  final TextOverflow? _overflow;
  final TextScaler? _textScaler;
  final int? _maxLines;
  final String? _semanticsLabel;
  final TextWidthBasis? _textWidthBasis;
  final TextHeightBehavior? _textHeightBehavior;
  final Color? _selectionColor;

  /// Creates a [ResponsiveText] widget.
  const ResponsiveText(this._data, {
    super.key,
    required ResponsiveTextStyle style,
    TextAlign textAlign = TextAlign.left,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    TextScaler? textScaler,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
  }) :       _style = style,
       _textAlign = textAlign,
       _textDirection = textDirection,
       _locale = locale,
       _softWrap = softWrap,
       _overflow = overflow,
       _textScaler = textScaler,
       _maxLines = maxLines,
       _semanticsLabel = semanticsLabel,
       _textWidthBasis = textWidthBasis,
       _textHeightBehavior = textHeightBehavior,
       _selectionColor = selectionColor, super(_data);

  @override
  Widget build(BuildContext context) {
    return Text(
      _data,
      textAlign: _textAlign,
      style: _style.getResponsiveTextStyle(),
      textDirection: _textDirection,
      locale: _locale,
      softWrap: _softWrap,
      overflow: _overflow,
      textScaler: _textScaler,
      maxLines: _maxLines,
      semanticsLabel: _semanticsLabel,
      textWidthBasis: _textWidthBasis,
      textHeightBehavior: _textHeightBehavior,
      selectionColor: _selectionColor,
    );
  }
}
