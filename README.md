# Tamwelly Task

A Flutter mobile application created as a test task demonstrating multiple Flutter development skills including UI, animations, state management with BLoC, responsive design, API integration, and offline handling.

## 📱 Screens Overview

### 1. Splash Screen
- Displays a loading animation simulating data loading.
- ![Splash Screen](screenshots/screen1.png)

### 2. Intro Screen
- Lottie animation with a welcome message.
- Language selection dropdown and "Start" button.
- ![Intro Screen](screenshots/screen2.png)

### 3. Home Screen
- Displays the company logo and four main navigation buttons:
    1. Contact Us
    2. Products
    3. Submit Complaint
    4. About Us
- ![Home Screen](screenshots/screen3.png)

---

## 🔹 Contact Us Screen
- Gradient app bar with a back button and title.
- Contact form with validation.
- Two quick contact methods:
    - WhatsApp: opens WhatsApp message to the company number.
    - Gmail: opens email intent.
- ![Contact Us](screenshots/screen4.png)

---

## 🛍️ Products Screen
- Fetches products from a dummy API.
- Responsive design:
    - 1 item per row on phones.
    - 2 items on wide phones.
    - 3 items on tablets.
- Shimmer loading shown while fetching data.
- State managed using BLoC.
- ![Products Phone](screenshots/screen5.png)
- ![Products Wide Phone](screenshots/screen6.png)
- ![Products Tablet](screenshots/screen7.png)

---

## 📩 Submit Complaint Screen
- Form with validation for all inputs.
- Dropdown for selecting complaint type fetched from dummy API via BLoC.
- Submit button shows loading indicator during request.
- ![Complaint Form](screenshots/screen8.png)
- ![Complaint Submitted](screenshots/screen9.png)

---

## 🏢 About Us Screen
- Image slider with pictures from the company website.
- Overview, mission, and vision sections.
- Live map using **OpenStreetMap** to show company location (no Google API key required).
- ![About Us](screenshots/screen10.png)

---

## 📶 Offline Banner
- Across the app, a persistent top banner shows when internet is lost.
- ![No Connection](screenshots/screen11.png)

---

## 🔧 Tech Stack

- Flutter
- BLoC (state management)
- Lottie
- OpenStreetMap
- Shimmer effect
- REST API integration
- Responsive UI design

---

## 🚀 Getting Started

1. **Clone the repo:**
   ```bash
   git clone https://github.com/your-username/tamwelly-task.git
   cd tamwelly-task
