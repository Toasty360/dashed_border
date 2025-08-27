```dart
import 'package:dashed_border/dashed_border.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: BorderTestScreen()));
}

class BorderTestScreen extends StatelessWidget {
  const BorderTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashed Border Test")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Basic dashed border
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                border: DashedBorder(
                  color: Colors.blue,
                  width: 2,
                  dashLength: 100,
                  dashGap: 10,
                  borderRadius: BorderRadius.circular(12),
                  style: BorderStyleEx.dashed,
                ),
              ),
              child: Center(child: Text("Dashed Border")),
            ),
            SizedBox(height: 20),

            // Solid border
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                border: DashedBorder(
                  color: Colors.red,
                  width: 2,
                  style: BorderStyleEx.solid,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Center(child: Text("Solid Border")),
            ),

            SizedBox(height: 20),
            // Circle
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: DashedBorder(
                  color: Colors.green,
                  width: 2,
                  dashLength: 4,
                  dashGap: 2,
                ),
              ),
              child: Center(child: Text("Circle")),
            ),
          ],
        ),
      ),
    );
  }
}

```