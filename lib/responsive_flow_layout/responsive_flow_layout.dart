import 'package:flutter/material.dart';
import 'flow_item.dart';

/// Un widget de layout responsivo que organiza sus hijos en múltiples filas.
///
/// Similar a [Wrap], pero los hijos en cada fila se expanden para llenar
/// el espacio horizontal disponible, respetando sus [FlowItem.minWidth] y [FlowItem.maxWidth].
///
/// Este widget es especialmente útil para crear layouts de tarjetas o elementos
/// que necesitan mantener un tamaño mínimo pero pueden expandirse para aprovechar
/// el espacio disponible.
///
/// Ejemplo de uso:
/// ```dart
/// ResponsiveFlowLayout(
///   spacing: 16.0,
///   runSpacing: 16.0,
///   children: [
///     FlowItem(
///       minWidth: 200,
///       maxWidth: 400,
///       child: Card(child: Text('Item 1')),
///     ),
///     FlowItem(
///       minWidth: 150,
///       child: Card(child: Text('Item 2')),
///     ),
///   ],
/// )
/// ```
class ResponsiveFlowLayout extends StatelessWidget {
  /// La lista de items a mostrar.
  final List<FlowItem> children;

  /// El espaciado horizontal entre elementos en una misma fila.
  final double spacing;

  /// El espaciado vertical entre filas.
  final double runSpacing;

  /// La alineación horizontal de los elementos en cada fila.
  final HorizontalFlowAxisAlignment horizontalAxisAlignment;

  /// La alineación vertical de todos los elementos en el diseño.
  final VerticalFlowAxisAlignment verticalAxisAlignment;

  /// Crea un [ResponsiveFlowLayout] con los parámetros especificados.
  ///
  /// [children] es la lista de [FlowItem] a mostrar.
  /// [spacing] controla el espacio horizontal entre elementos (por defecto 8.0).
  /// [runSpacing] controla el espacio vertical entre filas (por defecto 8.0).
  /// [horizontalAxisAlignment] controla la alineación horizontal en cada fila.
  /// [verticalAxisAlignment] controla la alineación vertical del layout completo.
  const ResponsiveFlowLayout({
    super.key,
    required this.children,
    this.spacing = 8.0,
    this.runSpacing = 8.0,
    this.horizontalAxisAlignment = HorizontalFlowAxisAlignment.start,
    this.verticalAxisAlignment = VerticalFlowAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;

        // No se puede renderizar en un ancho infinito
        if (!totalWidth.isFinite) {
          return const SizedBox.shrink();
        }

        final List<Widget> rows = _buildRows(totalWidth);

        if (rows.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          mainAxisAlignment: verticalAxisAlignment.alignment,
          mainAxisSize: MainAxisSize.min,
          children: rows,
        );
      },
    );
  }

  /// Construye todas las filas del layout.
  List<Widget> _buildRows(double totalWidth) {
    final List<Widget> rows = [];
    final List<FlowItem> currentRowItems = [];
    double currentRowMinWidth = 0;

    for (final item in children) {
      final itemMinWidthWithSpacing =
          item.minWidth + (currentRowItems.isEmpty ? 0 : spacing);

      // Verifica si el item cabe en la fila actual
      if (currentRowItems.isEmpty ||
          (currentRowMinWidth + itemMinWidthWithSpacing) <= totalWidth) {
        currentRowItems.add(item);
        currentRowMinWidth += itemMinWidthWithSpacing;
      } else {
        // Construye la fila actual y comienza una nueva
        rows.add(_buildExpandedRow(currentRowItems, totalWidth));

        // Añade espaciado vertical si no es la primera fila
        if (rows.length > 1) {
          rows.insert(rows.length - 1, SizedBox(height: runSpacing));
        }

        // Inicia nueva fila
        currentRowItems.clear();
        currentRowItems.add(item);
        currentRowMinWidth = item.minWidth;
      }
    }

    // Construye la última fila si hay elementos pendientes
    if (currentRowItems.isNotEmpty) {
      if (rows.isNotEmpty) {
        rows.add(SizedBox(height: runSpacing));
      }
      rows.add(_buildExpandedRow(currentRowItems, totalWidth));
    }

    return rows;
  }

  /// Construye una [Row] calculando el ancho de cada hijo para que se expandan
  /// respetando sus [FlowItem.minWidth] y [FlowItem.maxWidth].
  Widget _buildExpandedRow(List<FlowItem> items, double totalWidth) {
    final totalSpacing = (items.length - 1) * spacing;
    final availableWidth = totalWidth - totalSpacing;

    // Calcula los anchos finales para cada elemento
    final finalWidths = _calculateItemWidths(items, availableWidth);

    // Construye los widgets de la fila
    final List<Widget> rowChildren = [];
    for (int i = 0; i < items.length; i++) {
      rowChildren.add(SizedBox(width: finalWidths[i], child: items[i].child));

      // Añade espaciado entre elementos (excepto después del último)
      if (i < items.length - 1) {
        rowChildren.add(SizedBox(width: spacing));
      }
    }

    return Row(
      mainAxisAlignment: horizontalAxisAlignment.alignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: rowChildren,
    );
  }

  /// Calcula los anchos finales de cada elemento en la fila.
  List<double> _calculateItemWidths(
    List<FlowItem> items,
    double availableWidth,
  ) {
    // Inicializa los anchos finales con minWidth
    final finalWidths = items.map((item) => item.minWidth).toList();
    double remainingSpace =
        availableWidth - finalWidths.reduce((a, b) => a + b);

    // Lista de índices de los elementos que todavía pueden crecer
    var flexibleIndices = List<int>.generate(items.length, (i) => i);

    // Itera mientras haya espacio para distribuir y elementos que puedan crecer
    while (remainingSpace > 0.01 && flexibleIndices.isNotEmpty) {
      // Calcula el flex total solo de los elementos que aún son flexibles
      double totalFlex = flexibleIndices.fold(
        0.0,
        (sum, i) => sum + items[i].minWidth,
      );

      if (totalFlex == 0) break; // Evita división por cero

      // Copia la lista de flexibles para poder modificarla durante la iteración
      final currentFlexible = List<int>.from(flexibleIndices);
      flexibleIndices.clear();

      // Guarda el espacio que se va a redistribuir en esta pasada
      final spaceToDistribute = remainingSpace;
      remainingSpace = 0;

      for (final index in currentFlexible) {
        final item = items[index];

        // Calcula la porción de espacio extra para este elemento
        final spaceShare = spaceToDistribute * (item.minWidth / totalFlex);
        final newWidth = finalWidths[index] + spaceShare;

        // Comprueba si el nuevo ancho excede el maxWidth
        if (item.maxWidth != null && newWidth > item.maxWidth!) {
          // El elemento ha alcanzado su límite
          final overflow = newWidth - item.maxWidth!;
          finalWidths[index] = item.maxWidth!;

          // El espacio sobrante se volverá a distribuir en la siguiente iteración
          remainingSpace += overflow;
        } else {
          // El elemento todavía puede crecer
          finalWidths[index] = newWidth;
          flexibleIndices.add(index);
        }
      }

      // Si no hay más cambios, sal del bucle para evitar bucles infinitos
      if (flexibleIndices.length == currentFlexible.length) break;
    }

    return finalWidths;
  }
}
