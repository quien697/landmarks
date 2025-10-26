#  Landmarks

![Swift](https://img.shields.io/badge/Swift-6-orange.svg) ![Xcode](https://img.shields.io/badge/Xcode-26-blue.svg) ![Platform](https://img.shields.io/badge/platform-iOS%2026-lightgrey.svg) 

Project made while following along with tutorial in [SwiftUI Tutorial](https://developer.apple.com/tutorials/swiftui).



## 📝 Overview

A multi-platform SwiftUI app called **Landmarks**, demonstrating how to build, structure, and share SwiftUI views across iOS, watchOS, and macOS.



## 🛠️ Technologies & Frameworks

1. Xcode 26.0.1
2. Swift 6
3. iOS 26
4. SwiftUI
5. MVVM (Model–View–ViewModel architecture
6. MapKit
7. UIKit
8. Cross-platform support for iOS, watchOS, and macOS



## ✨ Features

1. **Introduction Screen** — overview of the trivia rules and gameplay.
1. **Settings Screen** — allows players to select trivia books and purchase new books via in-app purchases.
1. **Main Screen** — displays the latest three results on the main screen.
1. **Game Screen** —
   - Provides hints, including which book the current question belongs to.
   - Calculates and displays player scores in real time.



## 🧠 What I Learned

1. Applied the **MVVM architecture** for a clear separation between logic, data, and UI.
2. Integrated **MapKit** and **UIKit** components seamlessly within SwiftUI.
3. Extended the project to **watchOS** and **macOS**, reusing shared logic and UI layers.
4. Practiced **drawing and animation** techniques in SwiftUI.



## 🔮 Future Improvements

1. **Add UI tests** for all major views to ensure navigation, data flow, and interactions work correctly.



## 🧩 Architecture

The app follows the **MVVM (Model–View–ViewModel)** design pattern, separating logic, UI, and data management for better scalability and testing.



## 📂 Folder Structure

```text
.
├── Models/						# Data models used across the app
├── Views/            # Views grouped by screens or components
├── ViewModels/ 			# State management and business logic
├── Services/					# Utility classes and data loaders
└── Resources/				# Assets, images, and JSON data
└── WatchLandmarks		# watchOS-specific views
└── MacLandmarks/			# macOS-specific views
```



## 📸 Screenshots

<img src="/Users/quien/Code/Learning/iOS/SwiftUI/Landmarks/Landmarks/Screenshots/landmark-featured.png" alt="landmark-featured" style="zoom:15%;" /> <img src="/Users/quien/Code/Learning/iOS/SwiftUI/Landmarks/Landmarks/Screenshots/landmark-list.png" alt="landmark-list" style="zoom:15%;" /> <img src="/Users/quien/Code/Learning/iOS/SwiftUI/Landmarks/Landmarks/Screenshots/landmark-list-filter.png" alt="landmark-list-filter" style="zoom:15%;" /> <img src="/Users/quien/Code/Learning/iOS/SwiftUI/Landmarks/Landmarks/Screenshots/landmark-detail.png" alt="landmark-detail" style="zoom:15%;" /> <img src="/Users/quien/Code/Learning/iOS/SwiftUI/Landmarks/Landmarks/Screenshots/landmark-profile.png" alt="landmark-profile" style="zoom:15%;" /> <img src="/Users/quien/Code/Learning/iOS/SwiftUI/Landmarks/Landmarks/Screenshots/landmark-profile-edit.png" alt="landmark-profile-edit" style="zoom:15%;" /> 

<img src="/Users/quien/Code/Learning/iOS/SwiftUI/Landmarks/WatchLandmarks Watch App/Screenshots/watch-landmark-list.png" alt="watch-landmark-list" style="zoom:50%;" /> <img src="/Users/quien/Code/Learning/iOS/SwiftUI/Landmarks/WatchLandmarks Watch App/Screenshots/watch-landmark-detail.png" alt="watch-landmark-detail" style="zoom:50%;" /> 

<img src="/Users/quien/Code/Learning/iOS/SwiftUI/Landmarks/MacLandmarks/Screenshots/mac-landmark-list.png" alt="mac-landmark-list" style="zoom:100%;" />




## 🚀 Getting Started

1. Clone the repo

   ```bash
   git clone 
   ```

2. Open `.xcodeproj` in Xcode

3. Run on Simulator or Device



## 👨‍💻 Author

**Tsung-Hsun Liu**  
📧 [quien697@gmail.com](mailto:quien697@gmail.com)  
🌐 [tsunghsun.me](https://www.tsunghsun.me)



## 📄 License

MIT License © 2025 Tsung-Hsun Liu

