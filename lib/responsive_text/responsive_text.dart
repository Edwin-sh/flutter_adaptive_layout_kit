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
  final TextScaler? _textScaler;
  final int? _maxLines;
  final String? _semanticsLabel;
  final TextWidthBasis? _textWidthBasis;
  final TextHeightBehavior? _textHeightBehavior;
  final Color? _selectionColor;

  /// Creates a ResponsiveText widget.
  ///
  /// [text] is the string to display.
  /// [style] is the [ResponsiveTextStyle] that defines how the text appears on different screen sizes.
  /// [textAlign] defaults to [TextAlign.left].
  /// [textDirection] specifies the directionality of the text.
  /// [locale] is used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  /// [softWrap] whether the text should break at soft line breaks.
  /// [overflow] how visual overflow should be handled.
  /// [textScaleFactor] the number of font pixels for each logical pixel.
  /// [maxLines] an optional maximum number of lines for the text to span, wrapping if necessary.
  /// [semanticsLabel] an alternative semantics label for this text.
  /// [textWidthBasis] defines how to measure the width of the rendered text.
  /// [textHeightBehavior] defines how to apply TextStyle.height to the ascent of the first line and descent of the last line.
  /// [selectionColor] the color to use when painting the selection.
  const ResponsiveText({
    super.key,
    required String text,
    required ResponsiveTextStyle style,
    TextAlign textAlign = TextAlign.left, // Default value provided directly
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
  })  : _text = text,
        _style = style,
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
      textScaler: _textScaler,
      maxLines: _maxLines,
      semanticsLabel: _semanticsLabel,
      textWidthBasis: _textWidthBasis,
      textHeightBehavior: _textHeightBehavior,
      selectionColor: _selectionColor,
    );
  }
}
