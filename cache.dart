import 'package:proficient_lawyer/models/case.dart';

import 'models/schedule.dart';

List<Schedule> tempSchedules = [
  Schedule(
    title: "Urgent meeting",
    message:
        "sdbialka djdlixkqd. hdkwadand ack lmlcwmcl bzkhfcj kdwcilqk w j widmdd j  ohiddc,s   d  dh  iw.",
    label: "important",
    place: "Vythiri",
    date: "2020-12-27 18:30:00.000Z",
    time: "12:49 AM",
  ),
  Schedule(
    title: "Conference",
    message: "sdbialka djdlixkqd. hdkwadand ack lmlcwmcl.",
    date: "2020-12-27 18:30:00.000Z",
    time: "12:20 PM",
  ),
  Schedule(
    title: "meeting",
    date: "2020-12-27 18:30:00.000Z",
    message: "abcd.",
    time: "12:49 PM",
    label: "important",
  ),
  Schedule(
    title: "Urgent meeting",
    message: "sdbialka djdlixk.",
    date: "2020-12-27 18:30:00.000Z",
    time: "12:08 PM",
    place: "masda",
  ),
  Schedule(
    title: "Urgent meeting",
    message: "hdkwadand ack lmlcwmcl.",
    date: "2020-12-27 18:30:00.000Z",
    time: "02:29 PM",
  ),
  Schedule(
    title: "Urgent meeting",
    message: "ashckancas asdnkas asjdsm lsclcsalcjacsc nsalKSCNSC ALLcNCLK.",
    date: "2020-12-27 18:30:00.000Z",
    time: "10:49 PM",
    label: "important",
  ),
];

List<Case> cases = [];

Case tempSelectedCase = Case();

// {
//   "id": "bhscabjsd",
//   "courtDetails": {
//     "id": "bhscabjsd",
//     "caseAt": "District Court",
//     "state": "Kerala",
//     "district": "District",
//     "courtLocation": "District court complex",
//     "courtName": "sub court",
//     "caseType": "Civil"
//   },
//   "clientDetails": [
//     {
//       "id": "bhscabjsd",
//       "name": "John snow",
//       "rank": "defendend",
//       "address": "Kerala",
//       "phoneNo": "+91 99999 99999",
//       "email": "jerin@gmail.com"
//     }
//   ],
//   "oppositeParty": [
//     {
//       "id": "bhscabjsd",
//       "name": "John",
//       "rank": "opponent",
//       "address": "Kerala",
//       "advocateName": "Carl Emmanuel",
//       "phoneNo": "+91 99999 99999"
//     }
//   ],
//   "caseHistory": [
//     {
//       "id": "id",
//       "proceedings": "title",
//       "remarks": "title",
//       "advocate": "title",
//       "priority": "title",
//       "date": "title",
//       "adjournedDate": "title",
//       "attachments": [
//         {"link": "cdkck", "fileName": "dbcjh"}
//       ]
//     }
//   ]
// }

/// stacked copy
// class HomeScreenView extends StatelessWidget {
//   const HomeScreenView({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<HomeScreenViewModel>.reactive(
//       builder: (context, model, child) => Scaffold(
//         drawer: DrawerView(),
//         body: _Body(),
//       ),
//       viewModelBuilder: () => HomeScreenViewModel(),
//     );
//   }
// }

// class _Body extends ViewModelWidget<HomeScreenViewModel> {
//   const _Body({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, HomeScreenViewModel model) {
//     return Column(
//       children: [
//       ],
//     );
//   }
// }
