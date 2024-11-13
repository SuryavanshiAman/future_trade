import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Tree Structure')),
      body: Center(child: TreeView(rootNode: rootNode)),
    ),
  ));
}

class TreeNode {
  final String name;
  final String id;
  final String imageUrl;
  final List<TreeNode> children;

  TreeNode({
    required this.name,
    required this.id,
    required this.imageUrl,
    this.children = const [],
  });
}

final rootNode = TreeNode(
  name: 'Raj Kumar Gupta',
  id: 'AJ1194317',
  imageUrl: 'assets/avatar.png',
  children: [
    TreeNode(name: 'Shiv Kumar Gupta', id: 'AJ3440940', imageUrl: Assets.imagesUser),
    TreeNode(name: 'Resham Gupta', id: 'AJ2204492', imageUrl:Assets.imagesUser),
    TreeNode(name: 'Poornendu Tripathi', id: 'AJ3634110', imageUrl: Assets.imagesUser),
  ],
);

class TreeView extends StatelessWidget {
  final TreeNode rootNode;

  TreeView({required this.rootNode});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Root Node
        TreeNodeWidget(node: rootNode),
        if (rootNode.children.isNotEmpty)
          Column(
            children: [
              // Line connecting the parent to children
              CustomPaint(
                size: Size(200, 20), // Adjust based on the required length
                painter: LinePainter(),
              ),
              // Child Nodes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: rootNode.children.map((child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TreeNodeWidget(node: child),
                  );
                }).toList(),
              ),
            ],
          ),
      ],
    );
  }
}

class TreeNodeWidget extends StatelessWidget {
  final TreeNode node;

  TreeNodeWidget({required this.node});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Image.asset(node.imageUrl, width: 40, height: 40),
              SizedBox(height: 8),
              Text(node.name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(node.id, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.5;

    // Draw vertical line
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height / 2),
      paint,
    );

    // Draw horizontal line
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
