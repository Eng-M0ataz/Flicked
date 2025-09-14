# 🎬 Flickd - Movie Discovery App

<div align="center">
  <img src="assets/images/logo.png" alt="Flickd Logo" width="200"/>
  
  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
  [![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://developer.android.com/)
  [![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)](https://developer.apple.com/ios/)
</div>

## 📱 نظرة عامة / Overview

**Flickd** هو تطبيق Flutter حديث لاكتشاف الأفلام يتيح للمستخدمين استكشاف الأفلام الشائعة والقادمة مع واجهة مستخدم جميلة وتفاعلية.

**Flickd** is a modern Flutter movie discovery app that allows users to explore popular and upcoming movies with a beautiful and interactive user interface.

## ✨ المميزات الرئيسية / Key Features

### 🎯 المميزات الأساسية / Core Features
- **📋 قائمة الأفلام الشائعة** - تصفح الأفلام الأكثر شعبية
- **🔮 الأفلام القادمة** - اكتشف الأفلام الجديدة القادمة
- **🔍 البحث** - ابحث عن الأفلام المفضلة لديك
- **📱 تصميم متجاوب** - يعمل على جميع أحجام الشاشات
- **🎬 تفاصيل الأفلام** - عرض تفاصيل شاملة لكل فيلم
- **📺 مشغل يوتيوب** - مشاهدة تريلر الأفلام مباشرة

### 🎯 Core Features
- **📋 Popular Movies** - Browse the most popular movies
- **🔮 Upcoming Movies** - Discover new upcoming movies  
- **🔍 Search** - Search for your favorite movies
- **📱 Responsive Design** - Works on all screen sizes
- **🎬 Movie Details** - View comprehensive movie details
- **📺 YouTube Player** - Watch movie trailers directly

## 🛠️ التقنيات المستخدمة / Technologies Used

### Frontend
- **Flutter** - Cross-platform mobile development framework
- **Dart** - Programming language
- **Material Design** - UI design system

### State Management
- **Flutter Bloc** - State management solution
- **Cubit** - Lightweight state management

### Data Management
- **Hive** - Local database for caching
- **Dio** - HTTP client for API calls
- **Get It** - Dependency injection

### UI/UX
- **Responsive Framework** - Responsive design
- **Cached Network Image** - Image caching
- **Shimmer Animation** - Loading animations
- **Skeletonizer** - Skeleton loading

### Additional Features
- **YouTube Player Flutter** - Video playback
- **Flutter Secure Storage** - Secure data storage
- **Go Router** - Navigation management

## 📦 التثبيت والتشغيل / Installation & Setup

### المتطلبات / Prerequisites
- Flutter SDK (>=3.4.0)
- Dart SDK
- Android Studio / VS Code
- Git

### خطوات التثبيت / Installation Steps

1. **استنساخ المشروع / Clone the repository**
```bash
git clone https://github.com/yourusername/flickd.git
cd flickd
```

2. **تثبيت التبعيات / Install dependencies**
```bash
flutter pub get
```

3. **إعداد متغيرات البيئة / Setup environment variables**
```bash
# إنشاء ملف .env في المجلد الجذر
# Create .env file in root directory
touch .env
```

4. **إضافة API Key / Add API Key**
```env
# في ملف .env
# In .env file
TMDB_API_KEY=your_tmdb_api_key_here
```

5. **تشغيل التطبيق / Run the app**
```bash
# Android
flutter run

# iOS
flutter run -d ios

# Web
flutter run -d web
```

## 🏗️ هيكل المشروع / Project Structure

```
lib/
├── core/                    # Core functionality
│   ├── errors/             # Error handling
│   ├── get_it/             # Dependency injection
│   ├── services/           # Core services
│   ├── utils/              # Utilities and constants
│   └── widgets/            # Reusable widgets
├── features/               # Feature modules
│   ├── home/               # Home feature
│   │   ├── data/           # Data layer
│   │   ├── domain/         # Domain layer
│   │   └── presentation/   # Presentation layer
│   ├── movie_details/      # Movie details feature
│   └── splash/             # Splash screen
└── main.dart               # App entry point
```

## 🎨 لقطات الشاشة / Screenshots

<div align="center">
  <img src="https://github.com/user-attachments/assets/a5523a48-a33f-4ff5-b2de-abb6a5c1c0e2" alt="Home Screen" width="200"/>
  <img src="https://github.com/user-attachments/assets/1cac81c8-6d5b-4759-9086-de94a1a7d3dc" alt="Movie List" width="200"/>
  <img src="https://github.com/user-attachments/assets/5babdb83-f314-40b0-9e66-7d9f16cc3208" alt="Movie Details" width="200"/>
  <img src="https://github.com/user-attachments/assets/1d9bce4f-42a5-4cdf-9e67-53727fd3c784" alt="Search" width="200"/>
   <img src="https://github.com/user-attachments/assets/9c5531c8-c63b-416b-b1dd-3f7f51fc4c14" alt="Home Screen" width="200"/>
    <img src="https://github.com/user-attachments/assets/fde326e8-cad8-4416-8ed3-fd0826c76403" alt="Home Screen" width="200"/>
     <img src="https://github.com/user-attachments/assets/67c1e07a-ca2b-4493-b0f1-977f4d8b51ed" alt="Home Screen" width="200"/>
      <img src="https://github.com/user-attachments/assets/3190a050-19ba-48fe-9db0-0149cf19b540" alt="Home Screen" width="200"/>
       <img src="https://github.com/user-attachments/assets/18152a45-bd2d-4b68-9439-31fa75b9ad77" alt="Home Screen" width="200"/>
        <img src="https://github.com/user-attachments/assets/cf1a5be9-d512-489d-be39-6168f2b1c081" alt="Home Screen" width="200"/>
</div>

## 🚀 المميزات التقنية / Technical Features
### Architecture
- **Clean Architecture** - Separation of concerns
- **MVVM Pattern** - Model-View-ViewModel
- **Repository Pattern** - Data abstraction
- **Dependency Injection** - Loose coupling

### Performance
- **Image Caching** - Fast image loading
- **Local Storage** - Offline capability
- **Lazy Loading** - Efficient data loading
- **Memory Management** - Optimized resource usage

### User Experience
- **Dark Theme** - Modern dark interface
- **Smooth Animations** - Fluid transitions
- **Loading States** - User feedback
- **Error Handling** - Graceful error management

## 📱 المنصات المدعومة / Supported Platforms

- ✅ **Android** (API 21+)
- ✅ **iOS** (iOS 11+)
- ✅ **Web** (Chrome, Firefox, Safari)
- ✅ **Windows** (Windows 10+)
- ✅ **macOS** (macOS 10.14+)
- ✅ **Linux** (Ubuntu 18.04+)

## 🔧 التكوين / Configuration

### API Configuration
```dart
// في ملف .env
// In .env file
TMDB_API_KEY=your_api_key
TMDB_BASE_URL=https://api.themoviedb.org/3
TMDB_IMAGE_BASE_URL=https://image.tmdb.org/t/p/w500
```

### Hive Configuration
```dart
// Boxes configuration
HiveConstants.popularMovieBox = 'popular_movies'
HiveConstants.upcomingMovieBox = 'upcoming_movies'
```

## 🤝 المساهمة / Contributing

نرحب بمساهماتكم! يرجى اتباع الخطوات التالية:

We welcome contributions! Please follow these steps:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 الترخيص / License

هذا المشروع مرخص تحت رخصة MIT - راجع ملف [LICENSE](LICENSE) للتفاصيل.

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 المطور / Developer

**Your Name**
- GitHub: [Eng-M0ataz](https://github.com/Eng-M0ataz)
- Email: moatazebrahim221@gmail.com

## 🙏 شكر وتقدير / Acknowledgments

- [The Movie Database (TMDB)](https://www.themoviedb.org/) - For providing the movie API
- [Flutter Team](https://flutter.dev/) - For the amazing framework
- [Material Design](https://material.io/) - For the design system

## 📞 الدعم / Support

إذا واجهت أي مشاكل أو لديك أسئلة، يرجى فتح issue في GitHub.

If you encounter any issues or have questions, please open an issue on GitHub.

---

<div align="center">
  <p>صُنع بـ ❤️ باستخدام Flutter</p>
  <p>Made with ❤️ using Flutter</p>
</div>
