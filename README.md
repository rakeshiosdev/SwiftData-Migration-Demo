# SwiftData-Migration-MVVM

A SwiftUI demo app demonstrating **SwiftData schema migration** with **MVVM** and the **Repository Pattern**.

## 🚀 Features

* SwiftUI + SwiftData
* MVVM Architecture
* Repository Pattern
* Dependency Injection
* Versioned SwiftData Schemas
* Lightweight & Custom Migration
* CRUD Operations
* SwiftData Relationships
* Domain & Persistence Model separation
* Error Handling

## 🔄 Migration

Demonstrates schema evolution:

```text
V1 → V2 → V3
```

Example:

```text
V1: Product
    ├── id
    ├── name
    └── price

V2: Product
    ├── id
    ├── name
    ├── price
    └── qty?

V3: Product
    ├── id
    ├── name
    ├── price
    └── qty
```

Existing V1 products are migrated and assigned a default quantity.

## 🏗 Architecture

```text
SwiftUI View
     ↓
ViewModel
     ↓
Repository
     ↓
SwiftData
     ↓
Persistent Store
```

## 🛠 Tech Stack

* Swift
* SwiftUI
* SwiftData
* MVVM
* Repository Pattern

## 🎯 Purpose

This project is created as a practical reference for **SwiftData persistence, schema evolution, migration, and production-style architecture**.

## 👨‍💻 Author

**Rakesh Kumar**

Senior iOS Engineer | iOS Architect | React Native

[GitHub](https://github.com/rakeshiosdev) • [LinkedIn](https://linkedin.com/in/rakesh-kumar-b64b6011b)
