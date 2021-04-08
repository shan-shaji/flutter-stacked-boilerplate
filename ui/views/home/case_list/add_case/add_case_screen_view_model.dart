import 'package:proficient_lawyer/models/case.dart';
import 'package:proficient_lawyer/models/client_detail.dart';
import 'package:proficient_lawyer/models/case_details.dart';
import 'package:proficient_lawyer/models/opposite_party.dart';
import 'package:stacked/stacked.dart';

class AddCaseScreenViewModel extends BaseViewModel {
  var radioValue;
  var _radioValue = '';

  Case caseData;

  AddCaseScreenViewModel({this.caseData}) {
    if (caseData.id == null) {
      caseData.caseDetails = CaseDetails();
      caseData.clientDetails = <ClientDetail>[ClientDetail()];
      caseData.oppositeParties = <OppositeParty>[OppositeParty()];
    }
  }

  CaseDetails get caseDetails => caseData.caseDetails;

  List<ClientDetail> get clientDetails => caseData.clientDetails;

  List<OppositeParty> get oppositeParty => caseData.oppositeParties;

  get radio => _radioValue;

  void setCourtAt(value) {
    caseDetails?.caseAt = value;
    notifyListeners();
  }

  void setRadioValue(value) {
    radioValue = value;
    switch (radioValue) {
      case 1:
        _radioValue = 'Supreme Court';
        break;
      case 2:
        _radioValue = 'High Court';
        break;
      case 3:
        _radioValue = 'District Court';
        break;
    }
    notifyListeners();
  }

  List<String> courts = [
    "Supreme Court",
    "High Court",
    "District Court",
  ];

  void submitAction() {}
}
