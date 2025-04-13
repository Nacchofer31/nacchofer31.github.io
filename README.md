# 🚀 Nacchofer31 Portfolio

![Build](https://github.com/nacchofer31/nacchofer31.github.io/workflows/Web%20Deployment/badge.svg)
[![GitHub Pages](https://img.shields.io/badge/GitHub-Pages-blue?logo=github)](https://nacchofer31.github.io/)
[![Made with Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue?logo=flutter&logoColor=white)](https://flutter.dev)

---

## 🎯 About

This is my personal **Mobile developer portfolio** built with **Flutter Web**.  
It showcases my experience, skills, and projects in a clean and interactive interface.

🔗 **Live site:** [https://nacchofer31.github.io/](https://nacchofer31.github.io/)

---

## 🧰 Tech Stack

- **Flutter Web** (v3.29+)
- **Clean Architecture**
- **Cubit / BLoC**
- **Freezed**
- **Equatable**

---

## 🚧 Status

This project is a **Work in Progress (WIP)** — constantly improving and evolving.

---

## 🛠️ Setup (for development)

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run -d chrome
```

---

### 📦 Build for Web

```bash
dart run build_runner build --delete-conflicting-outputs
flutter build web --release
```

---

### 📤 Deploy (auto)

Every push to `main` triggers a GitHub Actions workflow that:

1. Builds the Flutter web app.
2. Updates the `/docs` folder.
3. Pushes it to `main`.
4. Publishes to GitHub Pages automatically.

---

## 📬 Contact

📧 [ignaciofer31@gmail.com](mailto:ignaciofer31@gmail.com)  
📂 [LinkedIn](https://www.linkedin.com/in/ignacio-ferrer-sanz/)

---

## 🤝 Contributing

> You can fork this repo and use it as a template to build your own Flutter portfolio!

---

✨ *Made with passion and a bit of caffeine.*
