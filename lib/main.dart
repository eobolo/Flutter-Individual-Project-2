import 'package:countryshow/screens/home_screen.dart';
import 'package:countryshow/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The entry point of the application.
void main() {
  runApp(const MyApp());
}

/// A StatelessWidget representing the main application.
/// This class sets up global configurations such as routing and theming.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Country App', // Application title
      initialRoute: '/', // Initial route of the app set to HomeScreen
      theme: ThemeData(
        primaryColor: Colors.teal, // Primary color used across the app
        hintColor: Colors.orangeAccent, // Hint color for text fields and other hints
        scaffoldBackgroundColor: Colors.white, // Background color for screens

        // TextTheme for consistent text styling across the app
        textTheme: const TextTheme(
          // Large, prominent text style used in AppBar titles
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          // Standard body text size for general content
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
          // Smaller body text style, suitable for secondary information
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
          // Title text style for card titles or other prominent elements
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          // Label text style for form input labels and smaller labels
          labelMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),

        // Customization for the AppBar widget
        appBarTheme: const AppBarTheme(
          color: Colors.teal, // AppBar background color
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white, // AppBar title text color
          ),
        ),
      ),

      // Route configuration using GetX for navigation
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(), // Root route displaying HomeScreen
        ),
        GetPage(
          name: '/search',
          page: () => const SearchScreen(), // Route for the SearchScreen
        ),
      ],
    );
  }
}
