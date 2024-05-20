# Maids.cc Test - Flutter Task Management App

**Description:**

Maids.cc Test is a Flutter application that empowers you to manage your cleaning tasks with user authentication and advanced features. Securely log in with a username and password, create, view, edit, and delete tasks efficiently. Pagination allows you to handle large sets of tasks seamlessly, while state management ensures a cohesive user experience across the app. Local storage keeps your tasks accessible even when offline.

**Getting Started**

1. **Prerequisites:**

   - Flutter SDK (version 3.16.7 ): https://docs.flutter.dev/get-started/install
   - A code editor Android Studio

2. **Installation:**

   1. Clone the repository:

      ```bash
      git clone [https://github.com/tawfik-ghamian/maids.ccTest.git](https://github.com/tawfik-ghamian/maids.ccTest.git)
      ```

   2. Navigate to the project directory:

      ```bash
      cd maids.ccTest
      ```

   3. Install dependencies:

      ```bash
      flutter pub get
      ```

3. **Running the Project:**

   - Open the project in your preferred code editor.
   - Run the app on a connected device or emulator:

      ```bash
      flutter run
      ```

**Features:**

- Secure user authentication using dummyjson.com (https://dummyjson.com/docs/auth).
- Flexible task management:
   - View, add, edit, and delete tasks.
   - Utilize dummyjson.com for task data management (https://dummyjson.com/docs/todos).
- Efficient pagination for handling large numbers of tasks (https://dummyjson.com/todos?limit=10&skip=10) with pulling up the list.
- State management for seamless UI updates (Provider).
- Persistent task storage using Flutter's shared preferences.

**Usage:**

- Log in securely using valid credentials from dummyjson.com.
- Create new tasks and manage existing ones.
- View paginated results for large task datasets.
- Benefit from state management for smooth UI updates.
- Access your tasks even when offline thanks to local storage.

**License:**

This project is licensed under the MIT License. See the LICENSE file for details.

**Author:**

Tawfik Ghamian (tawfikghamian1@gmail.com)

**Additional Information:**

- For more information on using Flutter, refer to the official documentation: https://docs.flutter.dev/
- Feel free to report any issues you encounter on the GitHub repository.

**Testing (Optional)**

This project includes unit tests using mock responses for critical functionalities:
- Task CRUD operations.
- Input validation.
- State management.
- Network requests.

**State Management (Optional):**

This project implements state management using a chosen pattern (Provider). Refer to the relevant documentation for detailed usage and best practices.

**Local Storage (Optional):**

This project employs local storage (shared preferences) for persisting tasks. Information on implementation will be available in the codebase.

**Secure Storage (Optional):**

This project employs secure storage for userid and user token that encrypt the data and store it to stay safe.


**Disclaimer:**

- Remember to replace dummy data with your own secure authentication backend when deploying the app.
- Choose and configure the desired state management pattern based on project requirements.

I hope this README provides a clear and informative overview of Maids.cc Test! Feel free to customize it further based on your project's specific details.
