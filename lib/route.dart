import 'package:go_router/go_router.dart';
import 'package:simple_flutter_template/features/easy_ui/social_page.dart';
import 'package:simple_flutter_template/features/home/home_page.dart';
import 'package:simple_flutter_template/features/login/login_page.dart';
import 'package:simple_flutter_template/features/easy_ui/qr_page.dart';
import 'package:simple_flutter_template/features/medium/note/add/note_add.dart';
import 'package:simple_flutter_template/features/medium/note/note_view.dart';
import 'package:simple_flutter_template/features/medium/tip_calculator.dart';
import 'package:simple_flutter_template/features/splash/splash_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/qr',
      builder: (context, state) => QrPage(
        username: state.pathParameters['username'] ?? '',
      ),
    ),
    GoRoute(
      path: '/social',
      builder: (context, state) => SocialPage(),
    ),
    GoRoute(
      path: "/tip/calculator",
      builder: (context, state) => TipCalculator(),
    ),
    GoRoute(
      path: "/note",
      builder: (context, state) => NoteView(),
    ),
    GoRoute(
      path: '/home/:username',
      builder: (context, state) {
        final username = state.pathParameters['username'] ?? '';
        return HomePage(
          username: username,
        );
      },
    ),
  ],
);
