import 'package:flutter/material.dart';

/// Screen that displays detailed information about a selected country.
class CountryDetailsScreen extends StatelessWidget {
  // Dynamic variable to hold country data passed from the previous screen.
  final dynamic country;

  const CountryDetailsScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with the country's common name as the title.
      appBar: AppBar(title: Text(country['name']['common'])),

      // Main content area with padding for layout spacing.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedOpacity(
          opacity: 1.0, // Set opacity (optional if dynamic fade is needed)
          duration: const Duration(milliseconds: 500),

          // Column containing various country detail cards.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card for displaying the capital city.
              _buildDetailCard('Capital', _getCapital(country['capital'])),
              const SizedBox(height: 10), // Spacer for layout

              // Card for displaying the population.
              _buildDetailCard(
                  'Population', country['population']?.toString() ?? 'N/A'),
              const SizedBox(height: 10),

              // Card for displaying the languages spoken.
              _buildDetailCard(
                  'Languages', _getLanguages(country['languages'])),
              const SizedBox(height: 10),

              // Card for displaying the primary currency.
              _buildDetailCard('Currency', _getCurrency(country['currencies'])),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a styled card widget to display each country's specific detail.
  Widget _buildDetailCard(String title, String detail) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.teal.shade700),
        ),
        subtitle: Text(detail, style: TextStyle(color: Colors.teal.shade600)),
      ),
    );
  }

  /// Helper function to retrieve the capital city of the country.
  /// - Returns the first capital if it's available in a list.
  /// - If the format is unexpected, returns 'N/A' as a fallback.
  String _getCapital(dynamic capital) {
    if (capital is List && capital.isNotEmpty) {
      return capital.first ?? 'N/A';
    }
    return 'N/A';
  }

  /// Helper function to retrieve the languages spoken in the country.
  /// - If `languages` is a Map, it joins values into a comma-separated string.
  /// - Returns 'N/A' if no languages are available or the format is incorrect.
  String _getLanguages(dynamic languages) {
    if (languages is Map && languages.isNotEmpty) {
      return languages.values.join(', ');
    }
    return 'N/A';
  }

  /// Helper function to retrieve the country's primary currency name.
  /// - Accesses the first currency name if `currencies` is a Map.
  /// - Returns 'N/A' if no currency is available or the format is incorrect.
  String _getCurrency(dynamic currencies) {
    if (currencies is Map && currencies.isNotEmpty) {
      return currencies.values.first['name'] ?? 'N/A';
    }
    return 'N/A';
  }
}
