# Sham Cash iOS Starter (Flutter)

Ready-to-use Flutter scaffold focused on **iOS**. This repo gives you:
- Clean architecture (features/core)
- Networking + storage layers
- Basic navigation (Router)
- Themings + iOS-friendly UI
- Assets pre-wired (images from the APK)

## Quick Start

1) Install Flutter & Xcode (macOS).
2) In this folder, run:
   ```bash
   flutter create .
   flutter pub get
   open ios/Runner.xcworkspace  # or use Xcode from VS Code
   ```
3) Set your iOS bundle id in `ios/Runner.xcodeproj` (Xcode) → Signing & Capabilities.
4) For Push Notifications/APNs:
   - Add `Push Notifications` and `Background Modes (Remote notifications)` in Signing & Capabilities.
   - Configure your provider (e.g., Firebase Messaging for iOS or direct APNs).
5) Run on iPhone simulator/device:
   ```bash
   flutter run -d ios
   ```

## Structure
- `lib/core/` shared helpers
- `lib/features/auth/` login session
- `lib/features/home/` main screens
- `assets/images/` imported from the original APK (subset)

## Notes
- This is a scaffold for re-implementing UI/logic based on the Android app.
- Replace placeholder endpoints/auth logic in `core/network/api_client.dart` and `features/auth/auth_repository.dart`.
- If the original app used FCM, switch to APNs (Firebase Messaging iOS) or other provider.