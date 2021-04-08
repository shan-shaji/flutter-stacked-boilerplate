import 'package:auto_route/auto_route_annotations.dart';
import 'package:proficient_lawyer/ui/views/home/case_list/add_case/add_case_screen_view.dart';
import 'package:proficient_lawyer/ui/views/home/case_list/case_list_screen_view.dart';
import 'package:proficient_lawyer/ui/views/home/case_list/case_view/case_screen_view.dart';
import 'package:proficient_lawyer/ui/views/home/home_screen_view.dart';
import 'package:proficient_lawyer/ui/views/onboarding/splash_screen/splash_screen_view.dart';
import 'package:proficient_lawyer/ui/views/schedules/schedules_screen_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: HomeScreenView),
    MaterialRoute(page: ScheduleScreenView),
    MaterialRoute(page: CaseListScreenView),
    MaterialRoute(page: CaseDetailsScreenView),
    MaterialRoute(page: AddCaseScreenView),
  ],
)
class $Router {}
