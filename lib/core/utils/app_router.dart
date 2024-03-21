import 'package:bookly/features/home/presentition/views/home_view.dart';
import 'package:bookly/features/payment/presentation/view/thank_you_view.dart';
import 'package:bookly/features/payment/presentation/view/widgets/payment_method_buttom_sheet.dart';
import 'package:bookly/features/search/presentition/views/search_view.dart';
import 'package:bookly/features/splash/presentition/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
