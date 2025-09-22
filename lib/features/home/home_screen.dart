import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/auth_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sham Cash'),
        actions: [
          IconButton(
            onPressed: () => context.read<AuthState>().logout(),
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('Welcome to Sham Cash iOS starter!', style: TextStyle(fontSize: 18)),
          SizedBox(height: 12),
          Text('Replace this screen with your real dashboard / transactions list.'),
        ],
      ),
    );
  }
}