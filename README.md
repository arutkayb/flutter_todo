[![Flutter unit test](https://github.com/arutkayb/flutter_todo/actions/workflows/github-actions-demo.yml/badge.svg)](https://github.com/arutkayb/flutter_todo/actions/workflows/github-actions-demo.yml)

# Flutter ToDo app

1. A kanban board for tasks, where users can create, edit, and move tasks between
   different columns (e.g. "To Do", "In Progress", "Done").
2. A timer function that allows users to start and stop tracking the time spent on each
   task.
3. A history of completed tasks, including the time spent on each task and the date it
   was completed.
4. A way to export data to CSV file

## How to run

You need to configure a Firebase Project to run the project (https://firebase.google.com/docs/flutter/setup)

1. Set up a Firebase Project (https://firebase.google.com/docs/guides)
2. Activate sign-in method Email/Password
3. Install the Firebase CLI (https://firebase.google.com/docs/cli)
4. Create a new project on Firebase Dashboard for this app
5. Log into Firebase using your Google account by running the following command:
`firebase login`
6. Install the FlutterFire CLI by running the following command from any directory:
`dart pub global activate flutterfire_cli`
7. From your Flutter project directory, run the following command to start the app configuration workflow:
`flutterfire configure`
8. Choose the project that you created for this app

## Internal
### Architecture
![ER Diagram](https://github.com/arutkayb/flutter_todo/blob/main/assets/images/acthitecture.png?raw=true)


## Internal Notes
Integration tests are only runnable on your local environment `flutter test integration_test`