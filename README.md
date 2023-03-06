[![Flutter unit test](https://github.com/arutkayb/flutter_todo/actions/workflows/github-actions-demo.yml/badge.svg)](https://github.com/arutkayb/flutter_todo/actions/workflows/github-actions-demo.yml)

# Flutter ToDo app

- [x] A kanban board for tasks, where users can create, edit, and move tasks between
  different columns (e.g. "To Do", "In Progress", "Done").
- [x] A timer function that allows users to start and stop tracking the time spent on each
  task.
- [ ] A history of completed tasks, including the time spent on each task and the date it
  was completed.
- [ ] A way to export data to CSV file
- [x] Cloud synchronization: Allow users to synchronize their tasks and time tracking data across
  multiple devices using Firebase.
- [ ] Analytics: Implement analytics to track how users are using the app and identify
  areas for improvement.
- [ ] Notifications: Add push notifications to remind users of upcoming tasks or to let
  them know when a task has been completed.
- [x] Collaboration: Allow multiple users to work on a task simultaneously and track their
  progress in real-time.
- [x] Customizable themes: Allow users to customize the look and feel of the app by
  choosing from a selection of pre-defined color schemes.
- [ ] Integration with third-party tools: Allow the app to integrate with other productivity
  tools such as calendars and task managers.
- [x] Offline functionality: Allow the app to work offline and automatically synchronize
  data when a connection is re-established.
- [x] Multi-language support: Add support for different languages, this will make the app
  more accessible to a global audience.

## Setup

You need to configure a Firebase Project to run the
project (https://firebase.google.com/docs/flutter/setup)

1. Set up a Firebase Project (https://firebase.google.com/docs/guides)
2. Activate sign-in method Email/Password
3. Install the Firebase CLI (https://firebase.google.com/docs/cli)
4. Create a new project on Firebase Dashboard for this app
5. Log into Firebase using your Google account by running the following command:
   `firebase login`
6. Install the FlutterFire CLI by running the following command from any directory:
   `dart pub global activate flutterfire_cli`
7. From your Flutter project directory, run the following command to start the app configuration
   workflow:
   `flutterfire configure`
8. Choose the project that you created for this app

## Run

1. Run `flutter test integration_test` to see if you did the setup properly
2. Enjoy the app

## Internal

### Architecture

![ER Diagram](https://github.com/arutkayb/flutter_todo/blob/main/assets/images/architecture.png?raw=true)

## Internal Notes

Integration tests are only runnable on your local environment `flutter test integration_test`