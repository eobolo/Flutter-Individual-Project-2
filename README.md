# Flutter Country Info App

A Flutter application that provides information on countries around the world, using the REST Countries API. This app allows users to browse, search, and view detailed information about each country, making use of GetX for efficient state management and navigation.

## Table of Contents
- [Features](#features)
- [Screens](#screens)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)
- [Credits](#credits)

## Features
- **Browse** a list of countries with names, capitals, and other key information.
- **Search** functionality for quick filtering of countries based on name.
- **Detailed View** for each country, including its population, languages, and currency.
- **Reactive UI** with real-time updates using GetX.
- **Clean UI** with a gradient background and custom themes for a visually appealing experience.

## Screens
1. **Home Screen**: Displays a list of countries with search navigation.
2. **Search Screen**: Allows users to input and filter countries by name.
3. **Country Details Screen**: Shows comprehensive details of a selected country.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/country-info-app.git
    cd country-info-app
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Run the application:
    ```bash
    flutter run
    ```

> **Note**: Ensure you have Flutter installed and set up on your machine. Refer to the [Flutter installation guide](https://flutter.dev/docs/get-started/install) for instructions.

## Usage

### Home Screen
- The app opens to the Home Screen where a list of countries is displayed.
- Users can scroll through the list to explore countries and tap a country to view its details.
- To search for a country, tap the search icon in the AppBar or use the floating action button to open the Search Screen.

### Search Screen
- The Search Screen provides an input field for users to type a country’s name and filter the list accordingly.
- The filtered list updates in real-time based on user input.
- Tapping a country from the list navigates to the Country Details Screen.

### Country Details Screen
- The Country Details Screen displays detailed information about the selected country, including:
  - Capital
  - Population
  - Languages
  - Currency
- Each piece of information is organized in separate cards for easy readability.

## Project Structure

```plaintext
lib/
├── controllers/
│   └── country_controller.dart   # Handles API calls, data fetching, and search functionality.
|
├── screens/
│   ├── home_screen.dart          # Displays list of countries with navigation to search and details.
│   ├── search_screen.dart        # Provides search functionality and displays filtered country results.
│   └── country_details_screen.dart # Shows detailed information about a selected country.
├── main.dart                     # Main application file, defines routes and initial setup.

## Credits

This project uses the [REST Countries API](https://restcountries.com/) to fetch up-to-date information about countries around the world.
