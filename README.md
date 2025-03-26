# TestTaskFaifly

## Test Task: iOS App with SwiftUI & Open API (Pagination & Favorites)

### Project Overview
This project is an iOS 17 application that integrates pagination and favorites functionality while utilizing modern frameworks and architectural principles.

### Technologies Used
- **Dependency Injection:** Factory
- **Navigation:** XCoordinator
- **Networking:** Alamofire
- **Image Handling:** Kingfisher
- **Reactive Programming:** Combine
- **Database:** Realm
- **UI Frameworks:** UIKit & SwiftUI
- **Type Safety:** Tagged

### Architecture
The views follow the **Single Responsibility Principle** (SRP) from SOLID principles, ensuring clear separation of concerns.

### Setup Instructions
1. Clone the repository.
2. Open the `.xcworkspace` file (not the `.xcodeproj`), as the project contains local Swift Packages.
3. Make sure you have Xcode 15+ installed.
4. Build and run the project on an iOS 17 simulator or device.

### Implementation Details
- **Navigation** is handled using **XCoordinator**, providing a structured and flexible way to manage screens.
- **Networking** operations leverage **Alamofire** for handling API requests efficiently.
- **Data Persistence** is managed using **Realm**, allowing offline storage of favorite items.
- **SPM Dependencies:** The project relies on **Swift Package Manager** (SPM), which might cause occasional false dependency errors due to Xcode’s limitations. These are not always related to the project itself.

### Features
✔ Pagination support for fetching data in batches.  
✔ Favorite functionality with persistent storage.  
✔ Modern architecture and dependency injection.  
✔ Combination of UIKit and SwiftUI components.  
✔ Custom navigation with XCoordinator.  

### Limitations
- The app supports iOS 17+ only.
- SPM dependency issues may appear randomly due to Xcode’s behavior.
- Some API limitations may affect the data fetching process.

### Additional Notes
If you encounter any issues with SPM dependencies, try cleaning the build folder (`Cmd + Shift + K`) and resolving package dependencies (`File > Packages > Reset Package Caches`).

---

### Demo
![App Demo](demo.gif)
