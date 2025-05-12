# 📚 BookMart

**BookMart** is a Flutter-based e-commerce app for buying books. Users can browse, search, filter, and paginate through a catalog of books, add items to their cart, apply discounts, and complete checkout with multiple payment options. Deep links let users jump directly to product details, and push notifications keep users informed.

---

## ✨ Features

- **User Registration & Login**  
  - Email/password sign-up  
  - Forgot-password flow with OTP  
- **Onboarding & Native Splash**  
  - Guided intro screens  
  - Customized native splash screen  
- **Catalog Browsing**  
  - Paginated book list  
  - Category filters & text search  
- **Deep Linking**  
  - Open product details directly via URL  
- **Cart & Discounts**  
  - Add/remove items, view badges on cart icon  
  - Apply promo codes or discounts  
- **Checkout Flow**  
  - Enter shipping address  
  - Multiple payment gateways: Stripe, Paymop, PayPal  
  - Secure key management via `.env`  
- **Order History**  
  - View past orders and statuses  
- **Push Notifications**  
  - Firebase Cloud Messaging  
  - Handled in all app states (foreground, background, terminated)  
- **Share Product Links**  
  - Shareable deep link for each book  

---

## 🛠️ Technologies & Packages

- **State Management:** `flutter_bloc` (Cubit)  
- **Architecture:** Clean Architecture  
- **Dependency Injection:** `get_it`  
- **Networking:** `dio` + `retrofit`  
- **Secure Storage:** `flutter_secure_storage` for tokens & session data  
- **Env Config:** `.env` via `flutter_dotenv` for payment keys  
- **Payments:** `flutter_stripe`, Paymop SDK, PayPal SDK  
- **Localization:** `easy_localization`  
- **Onboarding:** Custom onboarding flow  
- **Splash Screen:** `native_splash`  
- **Pagination & Filters:** UI + business logic in Cubits  
- **Deep Links:** `uni_links` or equivalent  
- **Notifications:** `firebase_messaging`  
- **OTP:** SMS-based one-time password for “Forgot Password”  
- **Storage:** Firebase Realtime Database / Firestore for user data  

All dependencies are wired up via **GetIt** for easy testing and maintenance.
