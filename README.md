# News App

### A software developer writes code, but a software engineer writes good code.

## Overview

This Flutter application is a News App that allows users to view news articles and save them locally for future reference. The app is built using the Clean Architecture principles, promoting separation of concerns and maintainability.

## Features

### View News Articles
- Browse through a list of news articles fetched from an external API.
- Read detailed information about each news article.

### Save News Locally
- Save interesting news articles locally to view them offline or for quick access.

## Tech Stack

- **Flutter**: A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **Clean Architecture**: The application is structured using Clean Architecture principles, separating the business logic from the presentation and data layers.
- **Dart**: The programming language used to develop the Flutter application.

## Getting Started

### Prerequisites

- Make sure you have Flutter installed. If not, follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/quickcodes/daily_news.git
   ```
2. Navigate to the project directory:
   ```
   cd daily_news
   ```
3. Install dependencies:
   ```
   flutter pub get
   ```
4. Run the app:
   ```
   flutter run    
   ```

## Folder Structure
The project follows a modular structure:

- lib/
    - data/: Data layer, responsible for handling data from external sources.
    - domain/: Domain layer, containing the business logic and use cases.
    - presentation/: Presentation layer, responsible for UI and user interactions.
    - core/: Core components shared across layers.
    - main.dart: Entry point of the application.
    - Contributing
    - Feel free to contribute to the project by opening issues, submitting pull requests, or suggesting improvements. Your feedback and contributions are highly appreciated.

```
lib
├───config
│   ├───routes
│   └───theme
├───core
│   ├───constants
│   ├───resources
│   └───usecase
└───features
    └───daily_news
        ├───data
        │   ├───data_source
        │   │   ├───local
        │   │   │   └───DAO
        │   │   └───remote
        │   ├───models
        │   └───repository
        ├───domain
        │   ├───entities
        │   ├───respository
        │   └───usecase
        └───presentation
            ├───bloc
            │   ├───local
            │   └───remote
            │       └───bloc
            ├───pages
            │   ├───article_detail
            │   ├───home
            │   └───saved_article
            └───widgets
```

## Contributing
Feel free to contribute to the project by opening issues, submitting pull requests, or suggesting improvements. Your feedback and contributions are highly appreciated.

<!-- ### License
##### This project is licensed under the MIT License.

Remember to customize this template according to your project's specific details, such as project structure, repository links, and additional information. -->

