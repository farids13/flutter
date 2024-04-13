import 'package:go_router/go_router.dart';
import 'package:note_apps/features/easy_ui/qr_page.dart';
import 'package:note_apps/features/easy_ui/social_page.dart';
import 'package:note_apps/features/home/home_page.dart';
import 'package:note_apps/features/login/login_page.dart';
import 'package:note_apps/features/medium/note/note_view.dart';
import 'package:note_apps/features/medium/tip_calculator.dart';
import 'package:note_apps/features/splash/splash_page.dart';

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
      path: '/qr/:username',
      builder: (context, state) => QrPage(
        username: state.pathParameters['username'] ?? '',
      ),
    ),
    GoRoute(
      path: '/social/:username',
      builder: (context, state) => SocialPage(
        username: state.pathParameters['username'] ?? '',
      ),
    ),
    GoRoute(
      path: "/tip/calculator/:username",
      builder: (context, state) => TipCalculator(
        username: state.pathParameters['username'] ?? '',
      ),
    ),
    GoRoute(
      path: "/note/:username",
      builder: (context, state) => NoteView(
        username: state.pathParameters['username'] ?? '',
      ),
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
