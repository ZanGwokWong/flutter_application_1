import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://via.placeholder.com/100'),
          ),
          const SizedBox(height: 20),
          const Text(
            'John Doe',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'johndoe@example.com',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('My Orders'),
            onTap: () {
              // TODO: Navigate to orders page
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Shipping Addresses'),
            onTap: () {
              // TODO: Navigate to addresses page
            },
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Payment Methods'),
            onTap: () {
              // TODO: Navigate to payment methods page
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // TODO: Navigate to settings page
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log Out'),
            onTap: () {
              // TODO: Implement logout functionality
            },
          ),
        ],
      ),
    );
  }
}
