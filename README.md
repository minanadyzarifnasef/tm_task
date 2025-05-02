# Tamweely Task - 

[![Flutter](https://img.shields.io/badge/Flutter-3.13.8-blue.svg)](https://flutter.dev)
[![BLoC](https://img.shields.io/badge/State%20Management-BLoC-purple.svg)](https://bloclibrary.dev)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

A Flutter application for Tamweel Microfinance with multi-language support, product catalog, complaint system, and company information.

![App Screenshot](screenshots/screen1.png)

## Features
- **Splash Screen** with loading animation
- **Multi-language** support (Arabic/English)
- **Four Main Modules**:
    - Contact Us form with validation
    - Product catalog with responsive grid
    - Complaint submission system
    - Company information with interactive map
- **State Management** using BLoC pattern
- **Responsive Design** (phone, tablet layouts)
- **Offline Detection** with top banner
- **Deep Linking** for WhatsApp/Email contacts

## Screenshots

| Splash Screen | Language Selection | Main Menu |
|---------------|--------------------|-----------|
| ![Splash](screenshots/screen1.png) | ![Language](screenshots/screen2.png) | ![Menu](screenshots/screen3.png) |

| Contact Us | Products (List) | Products (Grid) |
|------------|-----------------|-----------------|
| ![Contact](screenshots/screen4.png) | ![Products List](screenshots/screen6.png) | ![Products Grid](screenshots/screen7.png) |

| Product Loading (Shimmer) |
|--------------------------|
| ![Loading](screenshots/screen5.png) | 

| Complaint Form | Complaint Types | About Us |
|----------------|-----------------|----------|
| ![Complaint](screenshots/screen8.png) | ![Complaint Types](screenshots/screen9.png) | ![About](screenshots/screen10.png) |

| Offline Banner |
|----------------|
| ![Offline](screenshots/screen11.png) |

## Technologies Used
- **Frontend**: Flutter 3.13.8
- **State Management**: BLoC Pattern
- **Localization**: Flutter Intl
- **Networking**: Dio for API calls
- **Maps**: OpenStreetMap (Leaflet)
- **UI**: Shimmer loading, Lottie animations
- **Form Validation**: Flutter FormBuilder

## Installation
1. Ensure Flutter SDK is installed (>= 3.13.8)
2. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/tamweely-task.git