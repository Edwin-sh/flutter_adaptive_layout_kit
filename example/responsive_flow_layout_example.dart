import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/flutter_responsive_ui.dart';

/// Ejemplo de uso del ResponsiveFlowLayout
class ResponsiveFlowLayoutExample extends StatelessWidget {
  const ResponsiveFlowLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResponsiveFlowLayout Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ResponsiveFlowLayout Demo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Este layout distribuye automáticamente los elementos en filas, '
              'expandiendo cada elemento para aprovechar el espacio disponible '
              'mientras respeta los anchos mínimo y máximo.',
            ),
            const SizedBox(height: 24),

            // Ejemplo básico
            const Text(
              'Ejemplo básico:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ResponsiveFlowLayout(
              spacing: 12.0,
              runSpacing: 12.0,
              children: [
                FlowItem(
                  minWidth: 150,
                  maxWidth: 300,
                  child: _buildCard('Card 1', Colors.blue.shade100),
                ),
                FlowItem(
                  minWidth: 200,
                  maxWidth: 350,
                  child: _buildCard('Card 2', Colors.green.shade100),
                ),
                FlowItem(
                  minWidth: 120,
                  child: _buildCard('Card 3', Colors.orange.shade100),
                ),
                FlowItem(
                  minWidth: 180,
                  maxWidth: 280,
                  child: _buildCard('Card 4', Colors.purple.shade100),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Ejemplo con alineación centrada
            const Text(
              'Ejemplo con alineación centrada:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ResponsiveFlowLayout(
              spacing: 16.0,
              runSpacing: 16.0,
              horizontalAxisAlignment: HorizontalFlowAxisAlignment.center,
              verticalAxisAlignment: VerticalFlowAxisAlignment.center,
              children: [
                FlowItem(
                  minWidth: 100,
                  maxWidth: 200,
                  child: _buildCard('A', Colors.red.shade100),
                ),
                FlowItem(
                  minWidth: 120,
                  maxWidth: 180,
                  child: _buildCard('B', Colors.blue.shade100),
                ),
                FlowItem(
                  minWidth: 90,
                  maxWidth: 150,
                  child: _buildCard('C', Colors.green.shade100),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Ejemplo con elementos de diferentes tamaños
            const Text(
              'Ejemplo con elementos variados:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ResponsiveFlowLayout(
              spacing: 8.0,
              runSpacing: 8.0,
              horizontalAxisAlignment: HorizontalFlowAxisAlignment.spaceEvenly,
              children: [
                FlowItem(
                  minWidth: 80,
                  maxWidth: 120,
                  child: _buildCompactCard('S', Colors.cyan.shade100),
                ),
                FlowItem(
                  minWidth: 160,
                  maxWidth: 240,
                  child: _buildCard('Medium', Colors.amber.shade100),
                ),
                FlowItem(
                  minWidth: 200,
                  maxWidth: 400,
                  child: _buildCard('Large Element', Colors.pink.shade100),
                ),
                FlowItem(
                  minWidth: 100,
                  maxWidth: 150,
                  child: _buildCard('Normal', Colors.teal.shade100),
                ),
                FlowItem(
                  minWidth: 60,
                  maxWidth: 100,
                  child: _buildCompactCard('XS', Colors.lime.shade100),
                ),
              ],
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  /// Construye una tarjeta de ejemplo
  Widget _buildCard(String title, Color color) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  /// Construye una tarjeta compacta de ejemplo
  Widget _buildCompactCard(String title, Color color) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
