#  Square Repositories App

##  Overview

This is a simple iOS app that fetches and displays a list of repositories from the **Square** GitHub organization using their public API.

The goal of this project is to demonstrate clean code structure, MVVM architecture, and API integration using UIKit.

---

##  Architecture

The app follows a **MVVM (Model-View-ViewModel)** pattern to keep UI logic and business logic separate.

* **ViewController** → Handles UI
* **ViewModel** → Prepares and manages data for UI
* **Service Layer** → Handles API calls

The structure is kept simple and practical for this assignment while still being scalable.

---

##  Data Flow

ViewController → ViewModel → RepoService → NetworkService → API
Response → ViewModel → ViewController → UI

---

## ⚙️ Tech Stack

* Swift
* UIKit
* URLSession
* MVVM With Clean Architecture

---

## 📡 API

https://api.github.com/orgs/square/repos

---

## ✨ Features

* Displays list of repositories
* Shows repository name and description
* Clean and modular code structure
* Reusable networking layer
* Pull to refresh
* Unit test coverage

---

## 📦 Model Approach

The GitHub API response is quite large, but for this app I only used the fields required for the UI:

* `id`
* `name`
* `description`

This keeps the model simple, avoids unnecessary parsing, and makes the code easier to maintain.
It can be extended easily if more fields are needed.

---

## 📁 Project Structure

```
ELF Assessment/
│
├── App/
├── Data/
│   ├── Network/
│   ├── APIEndpoint.swift
│
├── Domain/
│   ├── Models/
│   ├── Services/
│
├── Presentation/
│   ├── ViewControllers/
│   ├── ViewModels/
│   ├── RepoTableViewCell/
│
├── Resources/
├── Tests/
└── README.md
```

---

## 🧪 Testing

### Unit Tests

* Covers `RepoListViewModel`
* Uses a mock service (`MockRepoService`) to simulate API responses
* Tests success and failure scenarios

---

### UI Tests

A basic UI test is added to verify that the repository list is displayed correctly.

It checks:

* App launches successfully
* TableView is visible
* At least one repository is displayed


> Note: Accessibility identifier (`repoTableView`) is set in the ViewController to support UI testing.

---

## 🚀 How to Run

1. Clone the repository
2. Open the project in Xcode
3. Run on simulator or device

---
## 👨‍💻 Author

Shivshankar Gupta
