import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/storage/app_prefs.dart';
import 'features/auth/auth_state.dart';
import 'features/home/home_screen.dart';
import 'features/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await AppPrefs.create();
  runApp(ShamCashApp(prefs: prefs));
}

class ShamCashApp extends StatelessWidget {
  final AppPrefs prefs;
  const ShamCashApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthState(prefs: prefs)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sham Cash',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home: Consumer<AuthState>(
          builder: (context, auth, _) {
            if (auth.isLoggedIn) return const HomeScreen();
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}