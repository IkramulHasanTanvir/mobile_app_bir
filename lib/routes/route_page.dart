import 'package:mobile_app_bir/futures/auth/views/screens/area_manager_screen.dart';
import 'package:mobile_app_bir/futures/auth/views/screens/change_pass_screen.dart';
import 'package:mobile_app_bir/futures/auth/views/screens/contact_support_screen.dart';
import 'package:mobile_app_bir/futures/auth/views/screens/forgot_pass_screen.dart';
import 'package:mobile_app_bir/futures/auth/views/screens/login_screen.dart';
import 'package:mobile_app_bir/futures/auth/views/screens/pin_confirmation_screen.dart';
import 'package:mobile_app_bir/futures/auth/views/screens/privacy_policy_screen.dart';
import 'package:mobile_app_bir/futures/cart/views/cart_screen.dart';
import 'package:mobile_app_bir/futures/dashboard/views/dashboard_screen.dart';
import 'package:mobile_app_bir/futures/home_pages/views/home_screen.dart';
import 'package:mobile_app_bir/futures/intro_pages/views/promotion_screen.dart';
import 'package:mobile_app_bir/futures/intro_pages/views/splash_screen.dart';
import 'package:mobile_app_bir/futures/navigation/views/bottom_nav_section.dart';
import 'package:mobile_app_bir/futures/search_products/views/search_products.dart';
import 'package:mobile_app_bir/futures/setting/language/views/language_screen.dart';
import 'package:mobile_app_bir/futures/setting/screens/setting_change_pass.dart';
import 'package:mobile_app_bir/futures/setting/screens/setting_otp.dart';
import 'package:mobile_app_bir/futures/setting/settings_screen.dart';
import 'package:mobile_app_bir/futures/transactions/views/transactions_date.dart';
import 'package:mobile_app_bir/futures/transactions/views/transactions_info.dart';
import 'package:mobile_app_bir/routes/route_name.dart';

abstract class RoutePage {
  static String initialRoute = RouteName.splashScreen;

  static var routes = {
    RouteName.splashScreen: (context) => const SplashScreen(),
    RouteName.promotionScreen: (context) => const PromotionScreen(),
    RouteName.loginScreen: (context) => const LoginScreen(),
    RouteName.forgotPassScreen: (context) => const ForgotPassScreen(),
    RouteName.changePassScreen: (context) => const ChangePassScreen(),
    RouteName.pinConfirmationScreen: (context) => const PinConfirmationScreen(),
    RouteName.homeScreen: (context) => const HomeScreen(),
    RouteName.dashboardScreen: (context) => const DashboardScreen(),
    RouteName.bottomNavBar: (context) => const BottomNavSection(),
    // RouteName.productDetailsScreen: (context) => const ProductDetailsScreen(),
    RouteName.searchProductsScreen: (context) => const SearchProducts(),
    RouteName.transactionsScreen: (context) => const TransactionsDate(),
    RouteName.areaManagerScreen: (context) => const AreaManagerScreen(),
    RouteName.contactSupport: (context) => const ContactSupportScreen(),
    RouteName.privacyPolicy: (context) => const PrivacyPolicyScreen(),
    RouteName.transactionsInfo: (context) => const TransactionsInfo(),
    RouteName.moreScreen: (context) => const SettingsScreen(),
    RouteName.languageScreen: (context) => const LanguageScreen(),
    RouteName.cartScreen: (context) => const CartScreen(),
    // RouteName.categoriesProduct: (context) => const CategoriesProducts(),
    //RouteName.checkoutScreen: (context) => const CheckoutScreen(),
    RouteName.settingChangePass: (context) => const SettingChangePass(),
    RouteName.settingOtp: (context) => const SettingOTP(),
    //RouteName.productsScreen: (context) => const ProductsScreen(),
    //RouteName.paymentScreen: (context) => const PaymentScreen(),
  };
}
