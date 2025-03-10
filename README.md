# IGStory

This project is a SwiftUI-based Instagram Stories clone. It showcases stories from users, allowing users to view, like, and mark stories as seen or unseen. The project uses SwiftUI for the UI, Combine for reactive programming, and UserDefaults for persistence.

## Project Structure

```
IGStory/
├── IGStory.swift
├── Models/
│   ├── User.swift
│   └── Story.swift
├── ViewModels/
│   ├── StoryListViewModel.swift
│   └── StoryViewModel.swift
├── Views/
│   ├── StoryListView.swift
│   └── StoryView.swift
├── Persistence/
│   └── PersistenceManager.swift
├── Resources/
│   └── users.json
├── Utils/
│   └── JSONLoader.swift
└── Tests/
    ├── InstagramStoriesTests.swift
    └── MockPersistenceManager.swift
```

## Features

- Display a list of users and their stories.
- Users' profile pictures are displayed in a horizontal scroll view at the top.
- Stories can be marked as seen or unseen.
- Stories can be liked or unliked.
- Navigation between stories using arrow buttons.

## MVVM Architecture

### Overview

The Model-View-ViewModel (MVVM) architecture is a widely adopted design pattern in iOS development, especially when using SwiftUI. MVVM helps to separate concerns within an application, making it easier to manage and test.

### Components

1. **Model**: Represents the data and business logic of the application. It is responsible for managing the data, either from a local database or a remote server. The model is completely independent of the user interface.

2. **View**: Represents the user interface and displays the data it receives from the ViewModel. In SwiftUI, the View is a struct that conforms to the `View` protocol. It is responsible for rendering the UI and reacting to user interactions.

3. **ViewModel**: Acts as a bridge between the Model and the View. It retrieves data from the Model and prepares it for display in the View. The ViewModel also handles user input from the View and updates the Model accordingly. The ViewModel is typically implemented as a class that conforms to the `ObservableObject` protocol in SwiftUI.

### Benefits of MVVM

- **Separation of Concerns**: Each component has a clear responsibility, making the codebase easier to understand and maintain.
- **Testability**: ViewModels can be easily tested without any dependency on the UI.
- **Reusability**: ViewModels can be reused across different Views.

### Implementation in This Project

- **Model**: 
  - `User.swift`: Represents a user with properties like `id`, `name`, and `profilePictureURL`.
  - `Story.swift`: Represents a story with properties like `id`, `userId`, `imageUrl`, `isSeen`, and `isLiked`.

- **View**: 
  - `StoryListView.swift`: Displays a list of users and their stories.
  - `StoryRow.swift`: Represents a row in the list of stories.
  - `UserStoryView.swift`: Represents the user profile picture in the horizontal scroll view.
  - `StoryView.swift`: Displays the stories of a selected user.

- **ViewModel**: 
  - `StoryListViewModel.swift`: Manages the state and logic for loading users and stories, and handling user interactions like marking stories as seen/unseen and liking stories.
  - `StoryViewModel.swift`: Manages the state and logic for a single story.

## Getting Started

### Prerequisites

- Xcode 12 or later
- Swift 5.3 or later

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/elaidi93/IGStory.git
   ```

2. Open the project in Xcode:
   ```sh
   open IGStory.xcodeproj
   ```

3. Build and run the project using Xcode.

## Usage

- Launch the app to see a list of users and their stories.
- Tap on a user to view their stories.
- Use the left and right arrow buttons to navigate between stories.
- Tap the heart icon to like or unlike a story.
- Tap the "Mark as Unseen" button to mark a story as unseen.

## Project Structure

- `Models/`: Contains the data models `User` and `Story`.
- `ViewModels/`: Contains the view models `StoryListViewModel` and `StoryViewModel` for managing the app's state.
- `Views/`: Contains the SwiftUI views `StoryListView`, `StoryRow`, `UserStoryView`, and `StoryView`.
- `Persistence/`: Contains `PersistenceManager` for handling data persistence using UserDefaults.
- `Resources/`: Contains the `users.json` file with mock user data.
- `Utils/`: Contains `JSONLoader` for loading JSON data from the app bundle.
- `Tests/`: Contains unit tests for the view models and a mock persistence manager.

## Unit Tests

Unit tests are located in the `Tests` directory. The tests cover the following functionalities:

- Loading users
- Loading stories
- Marking stories as seen/unseen
- Toggling the like status of stories

To run the tests, open the project in Xcode and press `Cmd + U`.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## Acknowledgements

- [SwiftUI](https://developer.apple.com/xcode/swiftui/)
- [Combine](https://developer.apple.com/documentation/combine/)
