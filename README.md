# Flutter MiNI E-Commerce App

A modern 3 Implemented Screen(Home,Cart,Product Details) for e-commerce application built using **Clean Architecture**, **Cubit** for state management, and a modular folder structure.  
The app integrates with a REST API to fetch products, categories, and manage cart operations.

---

## 🚀 Setup Instructions

Follow these steps to set up and run the project locally:

### 1. Clone the repository
```bash
git clone https://github.com/rafify2711/flutter-mini-e-commerce.git
cd flutter-mini-e-commerce
```
### 2. Install dependencies and Run the app
run :flutter pub get
run :flutter pub run build_runner build --delete-conflicting-outputs
run :flutter run

### API EndPoints 
**Base URL:** `https://fakestoreapi.com`


| Feature | Method | Endpoint               | Description |
|----------|---------|------------------------|--------------|
| Products | `GET` | `/products`            | Get list of all products |
| Categories | `GET` | `/products/categories` | Get all categories |

##  Folder Structure

`````
lib/
├── core/ # Core utilities and shared modules
│ ├── di/ # Dependency Injection setup (get_it, injectable)
│ ├── utils/ # App constants, colors, text styles
│ ├── config/
│ │ └── routes/ # Route generator for navigation
│ ├── api_manager/ # API handling (Dio, Retrofit)
│ └── widgets/ # Shared reusable UI widgets
│
├── features/ # App features, each with its own layers
│ ├── home/
│ │ ├── data/ # API models, repositories
│ │ ├── domain/ # Entities, use cases, repository interfaces
│ │ └── presentation/ # Screens, Cubits, and widgets
│ │
│ └── cart/
│ ├── data/ # Local cart management, repositories
│ ├── domain/ # Entities, use cases
│ └── presentation/ # Cart screens and Cubits
│
└── main.dart # App entry point

`````
## Architecture Layers

- Data Layer: Handles API communication and model conversion.

- Domain Layer: Contains use cases and business logic.

- Presentation Layer: Manages UI and state using Cubits.


### State Management Reasoning

# The app uses Cubit (from the flutter_bloc package) because it provides:

- Simple and predictable state transitions

- Clear separation between UI and logic

- Lightweight alternative to full Bloc

- Great testability and scalability

Each feature (Home, Cart) has its own Cubit managing its state independently.

## Technologies Used

Below are the main technologies and packages used in this Flutter project:

| Category | Package | Description |
|-----------|----------|-------------|
| **State Management** | `flutter_bloc` | For Cubit/Bloc-based state management |
| **Dependency Injection** | `get_it`, `injectable` | For clean and testable dependency injection |
| **Networking** | `dio`, `retrofit` | For API calls and HTTP communication |
| **Code Generation** | `build_runner`, `json_serializable`, `retrofit_generator`, `injectable_generator` | For automating model and DI code |
| **Localization** | `easy_localization` | For supporting multiple languages (AR/EN) |
| **Functional Programming** | `dartz` | For `Either` and functional-style error handling |
| **Location Services** | `geolocator`, `geocoding` | For retrieving and converting user location |
| **UI Enhancements** | `flutter_svg`, `skeletonizer`, `cupertino_icons` | For icons, skeleton loaders, and vector graphics |
| **Logging & Testing** | `logger`, `mockito` | For debugging and unit testing |

---

>  **Flutter Version:** 3.x  
>  **Dart SDK:** ^3.8.1

---

## Screens Overview
 - Home Screen: Displays banners, categories, and products list.

 - Cart Screen: Allows adding/removing products from the cart.

 - Product Details Screen: Shows product information and an “Add to Cart” option.


