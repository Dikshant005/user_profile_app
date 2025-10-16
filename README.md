# User Profiles App

A Flutter application that displays user profiles from the Random User API with clean architecture implementation.

## Features

- Clean Architecture with MVVM pattern
- State management using Riverpod
- Grid layout for user profiles
- Detailed profile view with hero animations
- Like/unlike functionality with state synchronization
- Pull-to-refresh
- Country filtering
- Responsive design
- Loading and error states
- Cached network images

## Architecture

The app follows clean architecture principles with three main layers:

### Data Layer
- **Models**: Data transfer objects
- **Data Sources**: API calls and local storage
- **Repositories**: Implementation of domain repositories

### Domain Layer
- **Entities**: Business objects
- **Repositories**: Abstract repository interfaces
- **Use Cases**: Business logic (integrated with repositories)

### Presentation Layer
- **Providers**: State management with Riverpod
- **Screens**: UI pages
- **Widgets**: Reusable UI components

