import 'package:countryshow/controllers/country_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'country_details_screen.dart';
import 'search_screen.dart'; // Import the SearchScreen for navigation

/// The main screen of the app that displays a list of countries and
/// includes navigation options to a search screen and country details.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize CountryController to manage country data and search functionality
    final CountryController controller = Get.put(CountryController());

    return Scaffold(
      // AppBar with title and search icon button
      appBar: AppBar(
        title: const Text('Countries'),
        actions: [
          // Icon button for navigation to the SearchScreen
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Get.to(() => const SearchScreen()); // Navigate to SearchScreen
            },
          ),
        ],
      ),

      // Background styling for the main screen
      body: Container(
        decoration: BoxDecoration(
          // Gradient background starting from teal and transitioning to orange
          gradient: LinearGradient(
            colors: [Colors.teal.shade300, Colors.orangeAccent.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        // Observing changes in `filteredCountries` and `isLoading` values
        child: Obx(() {
          if (controller.isLoading.value) {
            // Display a loading spinner while country data is being fetched
            return const Center(child: CircularProgressIndicator());
          }

          // ListView for displaying the list of filtered countries
          return ListView.builder(
            itemCount: controller.filteredCountries.length,
            itemBuilder: (context, index) {
              var country = controller.filteredCountries[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Text(
                    country['name']['common'], // Display country name
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // On tap, navigate to CountryDetailsScreen
                  onTap: () {
                    Get.to(CountryDetailsScreen(country: country));
                  },
                ),
              );
            },
          );
        }),
      ),

      // Floating action button for quick navigation to SearchScreen
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const SearchScreen()); // Navigate to SearchScreen
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.search), // Search icon for FAB
      ),
    );
  }
}
