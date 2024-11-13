import 'package:countryshow/controllers/country_controller.dart';
import 'package:countryshow/screens/country_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A StatelessWidget that provides a user interface to search for countries.
/// The screen allows users to enter a search term and view matching countries,
/// and tap on a country to view its detailed information.
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the CountryController instance to manage the state and functionality
    // related to searching and filtering countries.
    final CountryController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Countries'),
      ),
      body: Container(
        // Adds a background gradient to the search screen.
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade300,
              Colors.orangeAccent.shade100,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search input field
            TextField(
              decoration: InputDecoration(
                labelText: 'Search for a country',
                labelStyle: TextStyle(color: Colors.teal.shade900),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 20,
                ),
              ),
              // Updates the search term in the controller on each change
              onChanged: (value) {
                controller.updatesearchCountry(value);
              },
            ),
            const SizedBox(height: 20),

            // Expanded widget to fill available vertical space with search results
            Expanded(
              child: Obx(() {
                // Observes `filteredCountries` from the controller and updates
                // the UI when the list changes.
                if (controller.filteredCountries.isEmpty) {
                  // Shows a message if there are no matching countries.
                  return const Center(child: Text('No countries found.'));
                }

                // Displays a list of countries matching the search query.
                return ListView.builder(
                  itemCount: controller.filteredCountries.length,
                  itemBuilder: (context, index) {
                    // Access each country in the filtered list.
                    var country = controller.filteredCountries[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          country['name']['common'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Navigates to the CountryDetailsScreen when a country
                        // is tapped, passing the selected country as a parameter.
                        onTap: () {
                          Get.to(CountryDetailsScreen(country: country));
                        },
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
