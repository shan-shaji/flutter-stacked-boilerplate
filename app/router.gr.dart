// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/views/home/case_list/add_case/add_case_screen_view.dart';
import '../ui/views/home/case_list/case_list_screen_view.dart';
import '../ui/views/home/case_list/case_view/case_screen_view.dart';
import '../ui/views/home/home_screen_view.dart';
import '../ui/views/onboarding/splash_screen/splash_screen_view.dart';
import '../ui/views/schedules/schedules_screen_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String homeScreenView = '/home-screen-view';
  static const String scheduleScreenView = '/schedule-screen-view';
  static const String caseListScreenView = '/case-list-screen-view';
  static const String caseDetailsScreenView = '/case-details-screen-view';
  static const String addCaseScreenView = '/add-case-screen-view';
  static const all = <String>{
    splashScreenView,
    homeScreenView,
    scheduleScreenView,
    caseListScreenView,
    caseDetailsScreenView,
    addCaseScreenView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.homeScreenView, page: HomeScreenView),
    RouteDef(Routes.scheduleScreenView, page: ScheduleScreenView),
    RouteDef(Routes.caseListScreenView, page: CaseListScreenView),
    RouteDef(Routes.caseDetailsScreenView, page: CaseDetailsScreenView),
    RouteDef(Routes.addCaseScreenView, page: AddCaseScreenView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreenView(),
        settings: data,
      );
    },
    HomeScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeScreenView(),
        settings: data,
      );
    },
    ScheduleScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ScheduleScreenView(),
        settings: data,
      );
    },
    CaseListScreenView: (data) {
      final args = data.getArgs<CaseListScreenViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CaseListScreenView(
          key: args.key,
          selectedDate: args.selectedDate,
        ),
        settings: data,
      );
    },
    CaseDetailsScreenView: (data) {
      final args = data.getArgs<CaseDetailsScreenViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CaseDetailsScreenView(
          key: args.key,
          caseId: args.caseId,
        ),
        settings: data,
      );
    },
    AddCaseScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddCaseScreenView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CaseListScreenView arguments holder class
class CaseListScreenViewArguments {
  final Key key;
  final DateTime selectedDate;
  CaseListScreenViewArguments({this.key, @required this.selectedDate});
}

/// CaseDetailsScreenView arguments holder class
class CaseDetailsScreenViewArguments {
  final Key key;
  final String caseId;
  CaseDetailsScreenViewArguments({this.key, @required this.caseId});
}
