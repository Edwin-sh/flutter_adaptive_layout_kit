import 'package:flutter/material.dart';

/// Un elemento para ser usado dentro de [ResponsiveFlowLayout].
///
/// Contiene el [child] a mostrar y su [minWidth] base, que también
/// se usa como factor de expansión (flex).
class FlowItem {
  /// El widget hijo a mostrar.
  final Widget child;

  /// El ancho mínimo del elemento en píxeles lógicos.
  final double minWidth;

  /// El ancho máximo del elemento en píxeles lógicos.
  /// Puede ser nulo si no hay límite.
  final double? maxWidth;

  /// Crea un [FlowItem] con el [child] especificado.
  ///
  /// [minWidth] determina el ancho mínimo del elemento (por defecto 150).
  /// [maxWidth] es opcional y limita el crecimiento máximo del elemento.
  const FlowItem({required this.child, this.minWidth = 150, this.maxWidth})
    : assert(
        maxWidth == null || maxWidth >= minWidth,
        'maxWidth debe ser mayor o igual a minWidth',
      );
}

/// Alineación horizontal de los hijos en el Widget [ResponsiveFlowLayout].
enum HorizontalFlowAxisAlignment {
  /// Alinea los elementos al inicio de la fila.
  start(MainAxisAlignment.start),

  /// Centra los elementos en la fila.
  center(MainAxisAlignment.center),

  /// Alinea los elementos al final de la fila.
  end(MainAxisAlignment.end),

  /// Distribuye el espacio entre los elementos.
  spaceBetween(MainAxisAlignment.spaceBetween),

  /// Distribuye el espacio alrededor de los elementos.
  spaceAround(MainAxisAlignment.spaceAround),

  /// Distribuye el espacio uniformemente.
  spaceEvenly(MainAxisAlignment.spaceEvenly);

  /// La alineación correspondiente de Flutter.
  final MainAxisAlignment alignment;

  const HorizontalFlowAxisAlignment(this.alignment);
}

/// Alineación vertical de todos los hijos en el Widget [ResponsiveFlowLayout].
enum VerticalFlowAxisAlignment {
  /// Alinea los elementos al inicio del layout.
  start(MainAxisAlignment.start),

  /// Centra los elementos verticalmente.
  center(MainAxisAlignment.center),

  /// Alinea los elementos al final del layout.
  end(MainAxisAlignment.end),

  /// Distribuye el espacio entre las filas.
  spaceBetween(MainAxisAlignment.spaceBetween),

  /// Distribuye el espacio alrededor de las filas.
  spaceAround(MainAxisAlignment.spaceAround),

  /// Distribuye el espacio uniformemente entre las filas.
  spaceEvenly(MainAxisAlignment.spaceEvenly);

  /// La alineación correspondiente de Flutter.
  final MainAxisAlignment alignment;

  const VerticalFlowAxisAlignment(this.alignment);
}
