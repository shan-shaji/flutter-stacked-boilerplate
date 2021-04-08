import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proficient_lawyer/models/case.dart';
import 'package:proficient_lawyer/models/client_detail.dart';
import 'package:proficient_lawyer/ui/widgets/app_bar/common_app_bar.dart';
import 'package:proficient_lawyer/ui/widgets/button/text_button.dart';
import 'package:proficient_lawyer/ui/widgets/card/card_1.dart';
import '../../../../media/app_colors.dart';
import '../../../../media/app_text_styles.dart';
import 'package:stacked/stacked.dart';
import 'add_case_screen_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AddCaseScreenView extends StatelessWidget {
//   final Case caseData;
//
//   AddCaseScreenView({Key key, this.caseData}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<AddCaseScreenViewModel>.reactive(
//       builder: (context, model, child) => Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColor.primary,
//           centerTitle: true,
//           title: Text(
//             "Add new case",
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 25, top: 40.0),
//                 child: Text(
//                   'CLIENT DETAILS',
//                   style: AppTextStyles.s3(fontType: FontType.BOLD),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//                 child: ListView.builder(
//                   primary: false,
//                   shrinkWrap: true,
//                   itemCount: model.clientForms.length,
//                   itemBuilder: (context, index) {
//                     return model.clientForms[index];
//                   },
//                 ),
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   FlatButton(
//                     minWidth: 150,
//                     onPressed: () {
//                       GlobalKey<FormState> uKey = GlobalKey<FormState>();
//                       model.clientKeys.add(uKey);
//                       model.clientForms.add(clientDetails(uKey));
//                       model.updateChange();
//                     },
//                     child: Text(
//                       '+ Add more clients',
//                       style: AppTextStyles.s3(),
//                     ),
//                     color: AppColor.appSilver,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.0)),
//                   ),
//                   model.clientForms.length > 1
//                       ? Padding(
//                           padding: const EdgeInsets.only(left: 20),
//                           child: FlatButton(
//                             minWidth: 150,
//                             onPressed: () {
//                               GlobalKey<FormState> uKey =
//                                   GlobalKey<FormState>();
//                               model.clientKeys.removeLast();
//                               model.clientForms.removeLast();
//                               model.updateChange();
//                             },
//                             child: Text(
//                               '- Remove Client',
//                               style: AppTextStyles.s3(),
//                             ),
//                             color: AppColor.appSilver,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20.0)),
//                           ),
//                         )
//                       : SizedBox.shrink(),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 25, top: 40.0),
//                 child: Text(
//                   'OPPOSITE PARTY DETAILS',
//                   style: AppTextStyles.s3(fontType: FontType.BOLD),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//                 child: ListView.builder(
//                   primary: false,
//                   shrinkWrap: true,
//                   itemCount: model.oppPartyForms.length,
//                   itemBuilder: (context, index) {
//                     return model.oppPartyForms[index];
//                   },
//                 ),
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   FlatButton(
//                     minWidth: 150,
//                     onPressed: () {
//                       GlobalKey<FormState> uKey = GlobalKey<FormState>();
//                       model.oppPartyKeys.add(uKey);
//                       model.oppPartyForms.add(oppPartyDetails(uKey));
//                       model.updateChange();
//                     },
//                     child: Text(
//                       '+ Add more party',
//                       style: AppTextStyles.s3(),
//                     ),
//                     color: AppColor.appSilver,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.0)),
//                   ),
//                   model.oppPartyForms.length > 1
//                       ? Padding(
//                           padding: const EdgeInsets.only(left: 20),
//                           child: FlatButton(
//                             minWidth: 150,
//                             onPressed: () {
//                               model.oppPartyKeys.removeLast();
//                               model.oppPartyForms.removeLast();
//                               model.updateChange();
//                             },
//                             child: Text(
//                               '- Remove party',
//                               style: AppTextStyles.s3(),
//                             ),
//                             color: AppColor.appSilver,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20.0)),
//                           ),
//                         )
//                       : SizedBox.shrink()
//                 ],
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: BottomAppBar(
//           child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Expanded(
//                   child: Container(
//                     height: 60.0,
//                     child: FlatButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: Text(
//                         'Back',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                     color: AppColor.primary,
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                       height: 60.0,
//                       child: FlatButton(
//                         onPressed: () {
//                           model.formKey1.currentState.validate();
//                           for (int i = 0; i < model.clientKeys.length; i++) {
//                             model.clientKeys[i].currentState.validate();
//                           }
//                           for (int i = 0; i < model.oppPartyKeys.length; i++) {
//                             model.oppPartyKeys[i].currentState.validate();
//                           }
//                         },
//                         child: Text(
//                           'Submit',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                       color: AppColor.appBlue),
//                 ),
//               ]),
//           elevation: 0,
//         ),
//       ),
//       viewModelBuilder: () =>
//           AddCaseScreenViewModel(caseData: this.caseData ?? Case()),
//     );
//   }
//
//   Form clientDetails(Key key) {
//     return Form(
//         key: key,
//         child: Column(children: <Widget>[
//           _DataField(label: "Client name"),
//           _DataField(label: "Client rank"),
//           _DataField(label: "Address"),
//           _DataField(label: "Mail ID"),
//           _DataField(label: "Phone No."),
//           _DataField(label: "Other Details"),
//           SizedBox(
//             height: 30,
//           )
//
//           // Add TextFormFields and ElevatedButton here.
//         ]));
//   }
//
//   Form oppPartyDetails(Key key) {
//     return Form(
//         key: key,
//         child: Column(children: <Widget>[
//           _DataField(label: "Name"),
//           _DataField(label: "Rank"),
//           _DataField(label: "Address"),
//           _DataField(label: "Advocate Name"),
//           _DataField(label: "Phone No."),
//           _DataField(label: "Other Details"),
//           SizedBox(
//             height: 30,
//           )
//
//           // Add TextFormFields and ElevatedButton here.
//         ]));
//   }
// }

class AddCaseScreenView extends StatelessWidget {
  final Case caseData;

  AddCaseScreenView({Key key, this.caseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCaseScreenViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: _Body(),
      ),
      viewModelBuilder: () =>
          AddCaseScreenViewModel(caseData: this.caseData ?? Case()),
    );
  }
}

class _Body extends ViewModelWidget<AddCaseScreenViewModel> {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, AddCaseScreenViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonAppBar(
          title: "Add New Case",
          centerTitle: true,
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(10.nsp),
            children: [
              SizedBox(height: 10.nsp),
              _CaseDetails(),
              SizedBox(height: 50.nsp),
              _ClientDetails(),
              SizedBox(height: 50.nsp),
              _OppositePartyDetails(),
              SizedBox(height: 50.nsp),
              AppTextButton(
                title: "SUBMIT",
                color: AppColor.primary,
                style: AppTextStyles.s4(
                  fontType: FontType.BOLD,
                  color: AppColor.appBg,
                ),
                onTap: () => model.submitAction(),
              ),
              SizedBox(height: 50.nsp),
            ],
          ),
        ),
      ],
    );
  }
}

class _CaseDetails extends ViewModelWidget<AddCaseScreenViewModel> {
  const _CaseDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, AddCaseScreenViewModel model) {
    return AppCard1(
      child: Form(
        key: model.caseDetails.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.nsp),
            Text(
              'CASE DETAILS',
              style: AppTextStyles.s3(fontType: FontType.BOLD),
            ),
            SizedBox(height: 10.nsp),
            ...List.generate(
              model.courts.length,
              (index) => Row(
                children: [
                  Radio(
                    value: model.courts[index],
                    groupValue: model.caseDetails?.caseAt,
                    onChanged: model.setCourtAt,
                    activeColor: AppColor.appGreen,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  Expanded(
                    child: Text(
                      model.courts[index],
                      style: AppTextStyles.s3(),
                    ),
                  ),
                ],
              ),
            ).toList(),
            _DataField(
              label: "State",
              initialValue: model.caseDetails.state,
              onChanged: (txt) => model.caseDetails.state = txt,
            ),
            _DataField(
              label: "District",
              initialValue: model.caseDetails.district,
              onChanged: (txt) => model.caseDetails.district = txt,
            ),
            _DataField(
              label: "Court Location",
              initialValue: model.caseDetails.courtLocation,
              onChanged: (txt) => model.caseDetails.courtLocation = txt,
            ),
            _DataField(
              label: "Court Name",
              initialValue: model.caseDetails.courtName,
              onChanged: (txt) => model.caseDetails.courtName = txt,
            ),
            _DataField(
              label: "Case Type",
              initialValue: model.caseDetails.caseType,
              onChanged: (txt) => model.caseDetails.caseType = txt,
            ),
            SizedBox(height: 10.nsp),
          ],
        ),
      ),
    );
  }
}

class _ClientDetails extends ViewModelWidget<AddCaseScreenViewModel> {
  const _ClientDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, AddCaseScreenViewModel model) {
    return AppCard1(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.nsp),
          Text(
            'CLIENT DETAILS',
            style: AppTextStyles.s3(fontType: FontType.BOLD),
          ),
          SizedBox(height: 10.nsp),
          ...List.generate(model.clientDetails.length,
              (index) => _clientDetails(model.clientDetails[index])).toList(),
          SizedBox(height: 10.nsp),
        ],
      ),
    );
  }

  Form _clientDetails(ClientDetail clientDetail) {
    return Form(
        key: clientDetail.formKey,
        child: Column(children: <Widget>[
          _DataField(
            label: "Client Name",
            onChanged: (txt) => clientDetail.name = txt,
            textInputType: TextInputType.name,
          ),
          _DataField(
            label: "Client rank",
            onChanged: (txt) => clientDetail.rank = txt,
          ),
          _DataField(
            label: "Address",
            onChanged: (txt) => clientDetail.address = txt,
            textInputType: TextInputType.streetAddress,
          ),
          _DataField(
            label: "Mail ID",
            onChanged: (txt) => clientDetail.email = txt,
            textInputType: TextInputType.emailAddress,
          ),
          _DataField(
            label: "Phone No.",
            onChanged: (txt) => clientDetail.phoneNo = txt,
            textInputType: TextInputType.phone,
          ),
          // Add TextFormFields and ElevatedButton here.
        ]));
  }
}

class _OppositePartyDetails extends ViewModelWidget<AddCaseScreenViewModel> {
  const _OppositePartyDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, AddCaseScreenViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OPPOSITE PARTY DETAILS',
          style: AppTextStyles.s3(fontType: FontType.BOLD),
        ),
      ],
    );
  }
}

class _DataField extends StatelessWidget {
  final String label;
  final String Function(String) validator;
  final String initialValue;
  final void Function(String) onChanged;
  final TextInputType textInputType;

  _DataField({
    @required this.onChanged,
    @required this.label,
    this.validator,
    this.initialValue,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          InputDecoration(labelText: label, labelStyle: AppTextStyles.s3()),
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      keyboardType: textInputType ?? TextInputType.text,
    );
  }
}
