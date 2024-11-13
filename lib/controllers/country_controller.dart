import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

/// Controller class for managing country data and handling state within the application.
class CountryController extends GetxController {
  /// List to store all countries fetched from the API. It's an observable list that updates UI when changed.
  RxList countryList = [].obs;

  /// Boolean to indicate loading state during API call. Used to show loading indicators in UI.
  RxBool isLoading = false.obs;

  /// String to store and track search query input. Used to filter the displayed list of countries.
  RxString searchCountry = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCountries(); // Automatically fetches countries data when controller is initialized.
  }

  /// Fetches data from the REST Countries API.
  /// - Calls the API endpoint to get a list of all countries and stores the result in `countryList`.
  /// - Shows a loading indicator by setting `isLoading` to true while data is being fetched.
  /// - If the request is successful, it decodes and assigns the JSON response to `countryList`.
  /// - In case of a failed request, shows an error message using `Get.snackbar`.
  Future<void> fetchCountries() async {
    isLoading(true); // Set loading state to true.
    try {
      final response =
          await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

      // If response is successful (status code 200), decode and store data.
      if (response.statusCode == 200) {
        countryList.value = List.from(jsonDecode(response.body));
      } else {
        // Show error notification if request fails.
        Get.snackbar('Error', 'Failed to load countries');
      }
    } catch (e) {
      // Show error notification if an exception occurs.
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading(false); // Set loading state to false after request completion.
    }
  }

  /// Getter to provide a filtered list of countries based on the search query.
  /// - Returns the full `countryList` if the `searchCountry` query is empty.
  /// - Otherwise, it filters the `countryList` based on whether the country's common name contains the query string.
  List get filteredCountries {
    if (searchCountry.value.isEmpty) {
      return countryList;
    } else {
      // Filter `countryList` by matching search query with country name.
      return countryList
          .where((country) => country['name']['common']
              .toString()
              .toLowerCase()
              .contains(searchCountry.value.toLowerCase()))
          .toList();
    }
  }

  /// Updates the search query.
  /// - Takes a `query` string input and assigns it to `searchCountry`.
  /// - Triggers `filteredCountries` getter to update the displayed list in real time.
  void updatesearchCountry(String query) {
    searchCountry.value = query;
  }
}
