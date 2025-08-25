# Copilot Instructions for dart-course-materials

## Project Overview
This repository contains exercises, solutions, and projects for a comprehensive Dart programming course. The codebase is organized by topic and week, with a focus on hands-on learning and practical application of Dart features.

## Architecture & Structure
- **Top-level folders:**
  - `exercises/` — Markdown files for each exercise, organized by topic and lesson.
  - `solutions/` — Dart files with solutions matching exercises.
  - `Week1/`, `Week2/`, `Week3/` — Thematic folders for code samples, projects, and student work.
  - `projects/` — Larger, multi-file Dart command-line applications (e.g., `rock_paper_scissors`, `simple_ecommerce`, `weather_app`).
  - `lessons/` — Contains supporting files, example code, and `pubspec.yaml` for package management.

## Key Patterns & Conventions
- **Exercises:** Each exercise is paired with a solution file. Exercise files are Markdown (`.md`), solutions are Dart (`.dart`).
- **Project Structure:** Projects are self-contained, often with their own README and entry-point Dart file. Command-line apps use `main(List<String> args)` and read user input via `stdin` from `dart:io`.
- **Type Safety:** Dart's null safety is enforced throughout. Use explicit type annotations for clarity, especially in solutions and projects.
- **Collections:** Extensive use of Dart collections (`List`, `Set`, `Map`). Patterns include iteration, transformation, and aggregation. See `Week2/Collection/` for focused examples.
- **Error Handling:** Projects and advanced exercises demonstrate Dart's exception handling (`try`, `catch`, `finally`).
- **Functional Patterns:** Use of higher-order functions (`map`, `where`, `reduce`, etc.) is common in exercises and solutions.
- **Testing:** No formal test suite is present; correctness is validated by running code samples and projects interactively.

## Developer Workflows
- **Run a Dart file:**
  ```sh
  dart run <path-to-file.dart>
  ```
- **Run a project:**
  Navigate to the project folder and run the main Dart file.
  ```sh
  cd projects/rock_paper_scissors
  dart run rock_paper_scissors.dart
  ```
- **Install dependencies:**
  If a `pubspec.yaml` is present, run:
  ```sh
  dart pub get
  ```
- **Debugging:**
  Use print statements and run code interactively. VS Code launch configurations are not provided; use Dart CLI.

## Integration Points & External Dependencies
- **Dart SDK:** Required for all code. Some projects use external packages (see `pubspec.yaml` in `lessons/`).
- **No backend or frontend frameworks:** All code is Dart CLI or script-based.

## Project-Specific Patterns
- **Command-line argument parsing:** See `Week2/Project/Data_processing.dart` and `projects/rock_paper_scissors/` for examples.
- **File I/O:** Reading and writing files via `dart:io` is demonstrated in projects and exercises.
- **Null Safety:** All new code should use Dart's null safety features. Prefer non-nullable types unless explicitly required.
- **Named Parameters:** Use named parameters for clarity in function signatures, especially in solutions and advanced exercises.

## References
- See `README.md` for syllabus and topic breakdown.
- See `solutions/` and `projects/` for idiomatic Dart code and patterns.

---

**Feedback:** If any section is unclear or missing, please specify which workflows, patterns, or conventions need more detail for optimal AI agent productivity.
