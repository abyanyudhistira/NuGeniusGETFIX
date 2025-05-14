import 'package:get/get.dart';

import '../modules/addtask/bindings/addtask_binding.dart';
import '../modules/addtask/views/addtask_view.dart';
import '../modules/bottomnav/views/bottomnav_view.dart';
import '../modules/classroom/bindings/classroom_binding.dart';
import '../modules/classroom/views/classroom_view.dart';
import '../modules/discuss/bindings/discuss_binding.dart';
import '../modules/discuss/views/discuss_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/task/bindings/task_binding.dart';
import '../modules/task/views/task_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.WELCOME, // Ganti _Paths.WELCOME ke Routes.WELCOME
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.TASK,
      page: () => const TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: Routes.BOTTOMNAV,
      page: () => const BottomNavView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ADDTASK,
      page: () => const AddtaskView(),
      binding: AddtaskBinding(),
    ),
    GetPage(
      name: Routes.CLASSROOM,
      page: () => const ClassroomView(),
      binding: ClassroomBinding(),
    ),
    GetPage(
      name: Routes.DISCUSS,
      page: () => const DiscussView(),
      binding: DiscussBinding(),
    ),
  ];
}
