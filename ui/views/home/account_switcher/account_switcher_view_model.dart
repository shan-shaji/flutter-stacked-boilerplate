import 'package:proficient_lawyer/app/utils/toast_util.dart';
import 'package:proficient_lawyer/models/account.dart';
import 'package:stacked/stacked.dart';

class AccountSwitcherViewModel extends BaseViewModel {
  bool portalVisibility = false;

  void onPortalTap() {
    portalVisibility = !portalVisibility;
    notifyListeners();
  }

  List<Account> get accounts => List.generate(
      2,
      (index) => Account(
            id: index.toString(),
            name: "Law Office ${(index + 1).toString()}",
            type: index % 2 == 0 ? "Office" : "Individual",
            imageUrl: null,
          )).toList();

  void accountSelectAction(Account account) {
    showToast(msg: "Feature yet to be implemented");
  }

  void accountSettingsAction() {
    showToast(msg: "Feature yet to be implemented");
  }

  void subscriptionManagementAction() {
    showToast(msg: "Feature yet to be implemented");
  }
}
