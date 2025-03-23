# Trivy Assignment

## Overview
This Flutter project is a UI-based assignment focused on implementing a digital debit card with a freeze/unfreeze feature and a bottom navigation bar. It simulates a payment system with card details generated dynamically using the `faker` package.

## Features
- **Digital Debit Card UI**: Displays a simulated debit card with dynamically generated card numbers and expiry dates.
- **Freeze/Unfreeze Functionality**: Users can toggle the card status using an animation effect.
- **Bottom Navigation Bar**: Provides navigation between "Home," "Yolo Pay," and "Settings."
- **Theming**: Uses a dark theme for a sleek modern look.
- **Fake Data Generation**: Utilizes the `faker` package to generate random card details.

## Project Structure
- `main.dart`: Contains the main UI logic, including the card display, freeze/unfreeze feature, and bottom navigation bar.
- `CustomBottomNavBar`: A reusable widget for the bottom navigation bar.

## Dependencies
Ensure you have the following dependencies in your `pubspec.yaml` file:
```yaml
dependencies:
  flutter:
    sdk: flutter
  faker: ^2.1.0
```

## How to Run
1. Clone the repository:
   ```sh
   git clone https://github.com/SmitaPatel19/Trivy_Assignment.git
   ```
2. Navigate to the project directory:
   ```sh
   cd Trivy_Assignment
   ```
3. Get dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## License
This project is for learning purposes and is open for modifications.

