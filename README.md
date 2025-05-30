# 🚀 Nacchofer31 Portfolio

![Build](https://github.com/nacchofer31/nacchofer31.github.io/workflows/Web%20Deployment/badge.svg)
[![GitHub Pages](https://img.shields.io/badge/GitHub-Pages-blue?logo=github)](https://nacchofer31.github.io/)
[![Made with Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue?logo=flutter&logoColor=white)](https://flutter.dev)

---

## 🎯 About

This is my personal **Mobile developer portfolio** built with **Flutter Web**.  
It showcases my experience, skills, and projects in a clean and interactive interface.

🔗 **Live site:** [https://www.nacchofer31.dev/](https://www.nacchofer31.dev/)

---

## 🧰 Tech Stack

- **Flutter Web** (v3.29+)
- **Clean Architecture**
- **Get It**
- **Cubit / BLoC**
- **Freezed**
- **Equatable**
- **flutter_svg**
- **url_launcher**

---

## 🗂️ Content Configuration

All the content displayed on the website is fully configured from the `assets/` directory:

- `assets/raw/` contains the content files for each section, encoded in **JSON**.
- `assets/images/` stores all images used across the site.

This setup allows for easy customization of the portfolio by simply modifying or replacing the files in these folders.

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
