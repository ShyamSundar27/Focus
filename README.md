# User Focus & Productivity App

## Overview
The **User Focus & Productivity App** helps users stay productive by entering predefined focus modes: **Work, Play, Rest, and Sleep**. A timer tracks their focus duration, rewarding them with points and badges every two minutes. The app ensures session continuity even if the app is closed.

## Features
- **Custom Focus Mode – Users can create a personalized focus mode with a custom name, apart from the predefined modes (Work, Play, Rest, Sleep).
- **Focus Modes:** Users can select from four predefined focus modes.
- **Timer Functionality:**
  - Displays time in `MM:SS` format initially.
  - Switches to `HH:MM:SS` when an hour is crossed.
- **Points & Badges:**
  - Users earn 1 point and a random badge every 5 seconds.
  - Assigned badges are chosen randomly from different types.
- **Session Persistence:**
  - Active session resumes after app relaunch.
  - Accumulated points are retained.
- **Profile View:**
  - Displays user image, name, total points, total badges, and recent sessions.
  - Lists session details: Name, Duration, Points, and Start Time.
- **Custom Focus Mode:** Users can create and add custom focus modes.
- **Navigation:**
  - Home screen button to navigate to the profile view.
  - Stop Focusing button to manually end a session.

## Technologies Used
- **SwiftUI** for UI development
- **SwiftData** for local database storage
- **MVVM Architecture** for better separation of concerns
- **Dribbble UI Reference:** [Digital Detox App](https://dribbble.com/shots/20758015-Digital-detox-app)

## Installation & Setup
1. Clone the repository:
   ```sh
   git clone <repo-url>
   cd FocusApp
   ```
2. Open `FocusApp.xcodeproj` in Xcode.
3. Run the app on a simulator or a physical device.

## Screenshots
_Add relevant screenshots here_

## Future Improvements
- Integration with Apple Health for focus tracking.
- Syncing focus sessions across devices using iCloud.
- Advanced analytics on focus trends.

## Author
Developed by **Shyam**
