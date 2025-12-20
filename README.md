# Pandu LMS Application

## Project Overview

This project is submitted as a requirement for the Final Semester Examination (UAS) for the Mobile Programming course. **Pandu LMS** is a Flutter-based Learning Management System designed to facilitate academic interaction between students and lecturers. The application provides a comprehensive mobile interface for accessing courses, materials, assignments, and academic notifications.

## UX Flow and Navigation

The user experience (UX) is designed to be intuitive and focused on content accessibility:

1.  **Authentication**:
    *   **Login Page**: The entry point of the application. Users log in with their "Email 365" credentials. Upon successful authentication, they are directed to the Home Dashboard.

2.  **Dashboard (Home)**:
    *   The central hub displaying a personalized greeting, upcoming task alerts, academic announcements, and a visual summary of course progress.

3.  **Navigation**:
    *   A persistent **Bottom Navigation Bar** allows seamless switching between:
        *   **Home**: Dashboard view.
        *   **Kelas Saya**: List of enrolled courses.
        *   **Notifikasi**: System and academic alerts.
        *   **Profil**: User identity and settings.

4.  **Course Interaction**:
    *   **Kelas Saya** lists courses with details like lecturer and schedule.
    *   Tapping a course opens the **Detail Kelas** page.
    *   **Detail Kelas** uses a Tab View to separate "Materi" (Learning Materials) from "Tugas" (Assignments), ensuring focused study sessions.
    *   **Materi Page** offers a readable layout for study content with support for attachments (PDF, Video, Links).

## Development Methodology

This project utilizes **Git-based incremental development**. Features were implemented in logical stages to ensure code stability and maintainability:

*   **Stage 1: Setup**: Project initialization and removal of debug artifacts.
*   **Stage 2: Auth Flow**: Implementation of Login UI and navigation logic.
*   **Stage 3: Core Structure**: Establishment of Home Dashboard and Bottom Navigation.
*   **Stage 4: Course Browsing**: Implementation of Course List and Detail navigation.
*   **Stage 5: Deep Interaction**: Development of Course Details with TabBar and Material viewing.
*   **Stage 6: User Awareness**: Notification system implementation.
*   **Stage 7: Profile & Polish**: User Profile page and final UX refinement.

## Technical Specifications

*   **Framework**: Flutter
*   **Language**: Dart
*   **Architecture**: Widget-based component architecture with clean separation of UI and logic (where applicable for UI-focused tasks).
*   **State Management**: `StatefulWidget` for local state and navigation.

---

*Submitted by: [Nama Mahasiswa]*
*NIM: [NIM Mahasiswa]*
