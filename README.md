# MovieVerse 🎬

**MovieVerse** is a production-grade Flutter application for discovering movies, TV shows, actors, and personalized watchlist management. It showcases modern software engineering practices, Clean Architecture, MVVM pattern, Riverpod state management, Drift SQLite offline storage, and responsive Material 3 UI design.

---

## 🌟 Key Features

- **Streaming-Style Home Screen**: Auto-scrolling hero banner carousel, trending rails, top-rated media, upcoming releases, and continue watching.
- **Stateful Navigation**: `StatefulShellRoute` powered by `GoRouter` preserving scroll and interaction states across 5 primary tabs (Home, Search, Discover, Library, Profile).
- **Comprehensive Details View**: High-resolution backdrop hero animations, interactive cast avatars, embedded YouTube trailer player, ratings breakdown, recommendations, and streaming availability.
- **Smart Debounced Multi-Search**: Fast filtering across Movies, TV Series, and People with search history and instant suggestions.
- **Advanced Discover Engine**: Dynamic multi-parameter bottom-sheet filtering (Genres, Ratings, Release Years, Sort parameters).
- **Offline First**: Drift (SQLite) database caching for Watchlist, Favorites, Search History, and media entities with auto-fallback when offline.
- **Responsive Layout**: Designed to adapt seamlessly across Mobile, Tablet, and Desktop screen widths.

---

## 🛠️ Architecture & Tech Stack

- **Framework**: Flutter (Dart 3.x)
- **Architecture**: Clean Architecture + MVVM
- **State Management**: `flutter_riverpod` (`AsyncNotifier` & `Notifier`)
- **Networking**: `dio` with API Key, Logging, Retry, Error mapping, and `ApiResult<T>` pattern
- **Local Database**: `drift` (SQLite) with cross-platform desktop/mobile support
- **Navigation**: `go_router` with declarative nested routing
- **Media**: `cached_network_image`, `shimmer`, `youtube_player_iframe`

---

## 🚀 Getting Started

1. Clone or navigate to the repository:
   ```bash
   cd MovieVerse
   ```
2. Create your `.env` file from template:
   ```bash
   cp .env.example .env
   ```
3. Insert your TMDB API Key inside `.env`:
   ```env
   TMDB_API_KEY=your_tmdb_api_key_here
   TMDB_BASE_URL=https://api.themoviedb.org/3
   TMDB_IMAGE_BASE_URL=https://image.tmdb.org/t/p
   ```
4. Fetch dependencies & run build runner:
   ```bash
   flutter pub get
   ```
5. Launch the application:
   ```bash
   flutter run
   ```

---

## 🧪 Testing

Execute unit and widget tests:
```bash
flutter test
```
