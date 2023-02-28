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

1. If you haven't already, install the Firebase CLI. 
2. Create a new project on Firebase Dashboard for this app
3. Log into Firebase using your Google account by running the following command:
`firebase login`
4. Install the FlutterFire CLI by running the following command from any directory:
`dart pub global activate flutterfire_cli`
5. From your Flutter project directory, run the following command to start the app configuration workflow:
`flutterfire configure`

## Internal
### Architecture
![ER Diagram](https://github.com/arutkayb/flutter_todo/blob/main/assets/images/acthitecture.png?raw=true)
