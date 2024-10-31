import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final List<IconData> icons = [
    Icons.group,
    Icons.location_on,
    Icons.grid_view,
    Icons.point_of_sale,
    Icons.receipt,
    Icons.folder,
  ];

  final List<String> labels = [
    'Customers',
    'Suppliers',
    'Products',
    'POS',
    'Expenses',
    'Orders',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, Admin'),
            Text(
              'Online Soft Sell',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: icons.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 3 / 2, // Adjust the aspect ratio to make the grid items smaller
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              iconData: icons[index],
              label: labels[index],
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData iconData;
  final String label;

  const CategoryCard({Key? key, required this.iconData, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue[100], // Light blue color for the cards
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 50, color: Colors.green),
          SizedBox(height: 10),
          Text(label, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}