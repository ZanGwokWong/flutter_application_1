import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          icon: categories[index].icon,
          name: categories[index].name,
          color: categories[index].color,
        );
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final Color color;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryProductsPage(categoryName: name),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 8),
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;
  final Color color;

  Category({required this.name, required this.icon, required this.color});
}

final List<Category> categories = [
  Category(name: 'Electronics', icon: Icons.devices, color: Colors.blue),
  Category(name: 'Clothing', icon: Icons.shopping_bag, color: Colors.green),
  Category(name: 'Books', icon: Icons.book, color: Colors.orange),
  Category(name: 'Home & Garden', icon: Icons.home, color: Colors.purple),
  Category(name: 'Sports', icon: Icons.sports_soccer, color: Colors.red),
  Category(name: 'Beauty', icon: Icons.face, color: Colors.pink),
  Category(name: 'Toys', icon: Icons.toys, color: Colors.yellow),
  Category(name: 'Automotive', icon: Icons.directions_car, color: Colors.grey),
];

class CategoryProductsPage extends StatelessWidget {
  final String categoryName;

  const CategoryProductsPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: Center(child: Text('Products in $categoryName category')),
    );
  }
}
