# 📱 Calculator IOS Swift

A simple iOS calculator app built with **SwiftUI**.
This project was created as a class assignment to practice **layouts, state, and enums** in Swift.

---

## ✨ Features

* Basic calculator functions:
  ➕ Addition, ➖ Subtraction, ✖️ Multiplication, ➗ Division
* Special operations:
  🧹 Clear (AC), ➕/➖ Toggle sign, % Percent, Decimal point
* Clean UI with:
  🎨 Gradient background
  🎛 Round colorful buttons (yellow numbers, purple operations, white specials)
  📟 Large display text

---

## 📂 Project Structure

```
Calculator V1/
│
├── Model/
│   └── CalculatorModel.swift   # Enum `Keys` with button values & colors
│
├── Views/
│   └── ContentView.swift       # Main calculator UI and logic
│
├── Assets.xcassets/            # App colors & images
│
└── Calculator_06110App.swift   # App entry point
```

---

## 🚀 Getting Started

### Requirements

* macOS with **Xcode 15+**
* iOS Simulator (any iPhone model)

### Run the app

1. Clone the repo:

   ```bash
   git clone https://github.com/negarprh/Calculator-IOS-Swift.git
   cd swiftui-calculator
   ```
2. Open `Calculator V1.xcodeproj` in Xcode.
3. Select an iPhone simulator (e.g., iPhone 15).
4. Press **▶ Run** (⌘R).

---

## 🧑‍💻 How It Works

* **Keys enum**: holds all calculator buttons with their labels and colors.
* **State variables**: track the display, last value, and pending operation.
* **Simple logic**: when you tap `+ - x ÷`, the app stores the number and waits for the next one; pressing `=` performs the operation.

---

## 📸 Screenshots

<p align="center">
  <img src="Calculator V1/screenshot1.png" alt="Calculator Screenshot" width="250"/>
  
</p>


---

## 🎯 Learning Goals

* Practice **SwiftUI layouts** (`VStack`, `HStack`, `ZStack`)
* Understand **@State** for managing app state
* Use **enums** to model calculator keys
* Connect logic with UI in a beginner-friendly way
