import 'package:proficient_lawyer/app/locator.dart';
import 'package:proficient_lawyer/ui/views/home/home_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashScreenViewModel extends FutureViewModel<bool> {
  final NavigationService _navigationService = locator<NavigationService>();

  String title = "Profficient Lawyer";

  @override
  Future<bool> futureToRun() => runSplashService();

  Future<bool> runSplashService() async {
    await Future.delayed(Duration(milliseconds: 3500));
    return true;
  }

  @override
  void onError(error) {
    print(error.toString());
    super.onError(error);
  }

  @override
  void onData(bool data) {
    _navigationService.replaceWithTransition(
      HomeScreenView(),
      transition: NavigationTransition.DownToUp,
      duration: Duration(milliseconds: 800),
    );
    super.onData(data);
  }
}
