# Ibrahem Alhuossien — Flutter Developer Portfolio

A modern, responsive, and bilingual developer portfolio built with Flutter Web.

This portfolio showcases my Flutter projects, technical skills, experience, education, and certificates, with support for English and Arabic, RTL layouts, and light/dark themes.

## 🌐 Live Demo

**[View Portfolio](https://ibrahem-portfolio.web.app)**

## ✨ Features

- Responsive design for desktop, tablet, and mobile
- English and Arabic localization
- Full RTL support for Arabic
- Light and dark themes
- Persistent theme preference
- Smooth section navigation
- Dedicated project detail pages
- Project screenshot galleries
- Downloadable CV
- Social and contact links
- Firebase Hosting deployment
- Modern Material 3 UI
- Subtle hover and reveal animations

## 🛠 Tech Stack

- Flutter
- Dart
- Flutter Bloc / Cubit
- Material 3
- Shared Preferences
- URL Launcher
- Internationalization (l10n)
- Firebase Hosting

## 📂 Architecture

The project follows a feature-based, data-driven structure:

```text
lib/
├── app/
├── core/
│   ├── constants/
│   ├── extensions/
│   ├── localization/
│   ├── routing/
│   ├── theme/
│   ├── utils/
│   └── widgets/
├── data/
│   ├── models/
│   └── portfolio_data/
├── features/
│   ├── home/
│   ├── hero/
│   ├── about/
│   ├── skills/
│   ├── experience/
│   ├── projects/
│   ├── education/
│   ├── certificates/
│   └── contact/
├── logic/
│   ├── locale/
│   └── theme/
├── l10n/
└── main.dart
```

## 🚀 Featured Projects

### B2B Smart Ordering System — Admin Dashboard

A Flutter web admin dashboard for managing the administrative side of a B2B ordering system for supermarkets and suppliers.

**Technologies:** Flutter, Dart, Bloc/Cubit, Dio, Retrofit, GetIt, Freezed, Material 3

[View Repository](https://github.com/ibrahem137/B2B-Smart-Ordering-System-Dashboard)

### B2B Smart Ordering System — Mobile App

A Flutter mobile application for the supermarket side of a B2B smart ordering system, including catalog, orders, stock, offers, ledger, profile, and authentication functionality.

**Technologies:** Flutter, Dart, Bloc/Cubit, Dio, Retrofit, Freezed, JSON Serialization

### Gym Management Dashboard

A Flutter dashboard developed as a university team project for managing gym operations such as members, check-ins, trainers, reports, and dashboard analytics.

**Technologies:** Flutter, Dart, Bloc/Cubit, Dio, Retrofit, GetIt, Freezed, fl_chart

## 🌍 Localization

The portfolio supports:

- English
- Arabic
- RTL layouts for Arabic

## 🎨 Theme

The application provides:

- Light Mode
- Dark Mode
- Persistent theme selection

The interface is built using Material 3 with a custom blue design system.

## 💻 Run Locally

Make sure Flutter is installed, then clone the repository:

```bash
git clone https://github.com/ibrahem137/ibrahem-portfolio.git
cd ibrahem-portfolio
flutter pub get
flutter run -d chrome
```

To create a production build:

```bash
flutter build web --release
```

## 🔥 Deployment

The portfolio is deployed using Firebase Hosting.

```bash
flutter build web --release
firebase deploy --only hosting
```

## 👨‍💻 About Me

I'm a fifth-year Software Engineering student at the University of Aleppo and a Flutter developer focused on building modern mobile and web applications.

I enjoy transforming ideas and designs into structured, maintainable applications using Flutter, Bloc/Cubit, REST APIs, dependency injection, and feature-based architectures.

## 📫 Contact

- **Email:** ibrahemalhuossienbusiness@gmail.com
- **LinkedIn:** [ibrahem-alhuossien](https://www.linkedin.com/in/ibrahem-alhuossien-92b0a5379)
- **GitHub:** [ibrahem137](https://github.com/ibrahem137)
- **Portfolio:** [ibrahem-portfolio.web.app](https://ibrahem-portfolio.web.app)

---

Built with Flutter 💙 by **Ibrahem Alhuossien**
