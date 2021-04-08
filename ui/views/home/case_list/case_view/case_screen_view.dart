import 'package:flutter/material.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/media/app_text_styles.dart';
import 'package:proficient_lawyer/ui/widgets/app_bar/common_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'case_screen_view_model.dart';

class CaseDetailsScreenView extends StatefulWidget {
  final String caseId;
  const CaseDetailsScreenView({
    Key key,
    @required this.caseId,
  }) : super(key: key);

  @override
  _CaseDetailsScreenViewState createState() => _CaseDetailsScreenViewState();
}

class _CaseDetailsScreenViewState extends State<CaseDetailsScreenView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CaseDetailsScreenViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: _Body(),
      ),
      viewModelBuilder: () =>
          CaseDetailsScreenViewModel(widget.caseId, vsync: this),
    );
  }
}

class _Body extends ViewModelWidget<CaseDetailsScreenViewModel> {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, CaseDetailsScreenViewModel model) {
    return Column(
      children: [
        CommonAppBar(
          title: "OS/2014/1923/23",
          centerTitle: false,
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              _TabView(),
              SizedBox(height: 10.nsp),
              _CaseOptions(),
              SizedBox(height: 20.nsp),
              _CaseHistory(),
              SizedBox(height: 50.nsp),
            ],
          ),
        ),
      ],
    );
  }
}

class _TabView extends ViewModelWidget<CaseDetailsScreenViewModel> {
  const _TabView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, CaseDetailsScreenViewModel model) {
    return model.tabController != null
        ? ListView(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                color: AppColor.primary,
                child: TabBar(
                  controller: model.tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: AppColor.appOrange,
                  labelStyle: AppTextStyles.s3(fontType: FontType.SEMI_BOLD),
                  unselectedLabelStyle: AppTextStyles.s2(),
                  onTap: model.updateTabIndex,
                  tabs: [
                    Tab(text: "Court Details"),
                    Tab(text: "Client Details"),
                    Tab(text: "Opposite Party"),
                  ],
                ),
              ),
              if (model.tabController.index == 0)
                _CaseDetail(model: model)
              else if (model.tabController.index == 1)
                _ClientDetail(model: model)
              else if (model.tabController.index == 2)
                _OppositeParty(model: model),
            ],
          )
        : Container();
  }
}

class _CaseDetail extends StatelessWidget {
  final CaseDetailsScreenViewModel model;
  const _CaseDetail({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _KeyValueText(keyText: "Case at", valueText: "District Court"),
        _KeyValueText(keyText: "State", valueText: "Kerala"),
        _KeyValueText(keyText: "District", valueText: "Thrissur"),
        _KeyValueText(
            keyText: "Court Location", valueText: "District Court Complex"),
        _KeyValueText(keyText: "Court Name", valueText: "Sub Court"),
        _KeyValueText(keyText: "Case Type", valueText: "Civil"),
      ],
    );
  }
}

class _ClientDetail extends StatelessWidget {
  final CaseDetailsScreenViewModel model;
  const _ClientDetail({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _KeyValueText(keyText: "Name", valueText: "John Snow"),
      _KeyValueText(keyText: "Rank", valueText: "Defendend"),
      _KeyValueText(
          keyText: "Address",
          valueText: "House No.123, Gandhi Nagar 2nd Street, Thrissur, Kerala"),
      _KeyValueText(keyText: "Phone No", valueText: "+91 99999 99999"),
      _KeyValueText(keyText: "Email", valueText: "john123@gmail.com"),
    ]);
  }
}

class _OppositeParty extends StatelessWidget {
  final CaseDetailsScreenViewModel model;
  const _OppositeParty({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _KeyValueText(keyText: "Name", valueText: "Jerin Joseph"),
        _KeyValueText(keyText: "Rank", valueText: "Opponent"),
        _KeyValueText(
            keyText: "Address",
            valueText: "House No.123, Jawhar Nagar 2nd Street, Mumbai"),
        _KeyValueText(keyText: "Advocate's Name", valueText: "Carl Emmanuel"),
        _KeyValueText(keyText: "Phone No", valueText: "+91 88888 99999"),
      ],
    );
  }
}

class _KeyValueText extends StatelessWidget {
  final String keyText;
  final String valueText;
  const _KeyValueText({
    Key key,
    @required this.keyText,
    @required this.valueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.nsp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.nsp),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        keyText,
                        style: AppTextStyles.s3(),
                      ),
                    ),
                    // Spacer(),
                    Text(
                      " : ",
                      style: AppTextStyles.s3(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Text(
                  valueText,
                  style: AppTextStyles.s3(fontType: FontType.MEDIUM),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.nsp),
          Divider(height: 1.nsp),
        ],
      ),
    );
  }
}

class _CaseOptions extends ViewModelWidget<CaseDetailsScreenViewModel> {
  const _CaseOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, CaseDetailsScreenViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.nsp),
      child: Row(
        children: [
          Expanded(
            child: _OptionButton(
              icon: Icons.edit_outlined,
              title: "Edit Case Detail",
              onTap: () {},
            ),
          ),
          Expanded(
            child: _OptionButton(
              icon: Icons.link,
              title: "Connected Cases",
              onTap: () {},
            ),
          ),
          Expanded(
            child: _OptionButton(
              icon: Icons.add,
              title: "Add Proceedings",
              onTap: () => model.showAddProceedingDialog(),
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final String title;
  final VoidCallback onTap;
  const _OptionButton({
    Key key,
    @required this.icon,
    this.iconColor = AppColor.appBg,
    this.backgroundColor = AppColor.appOrange,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => onTap?.call(),
          borderRadius: BorderRadius.circular(35.nsp),
          child: Padding(
            padding: EdgeInsets.all(10.nsp),
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.nsp),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1.nsp, 4.nsp),
                      color: AppColor.appSilver,
                      blurRadius: 2.nsp,
                    )
                  ]),
              child: CircleAvatar(
                backgroundColor: backgroundColor,
                maxRadius: 25.nsp,
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            ),
          ),
        ),
        if (title != null)
          Text(
            title,
            style: AppTextStyles.s1(),
          ),
      ],
    );
  }
}

class _CaseHistory extends ViewModelWidget<CaseDetailsScreenViewModel> {
  const _CaseHistory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, CaseDetailsScreenViewModel model) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.symmetric(horizontal: 10.nsp),
      physics: NeverScrollableScrollPhysics(),
      children: [
        Text(
          "- Case History -",
          style: AppTextStyles.s3(fontType: FontType.MEDIUM),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.nsp),
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (_, index) {
            return _ProceedingCard(
              onTap: () {},
            );
          },
        )
      ],
    );
  }
}

class _ProceedingCard extends StatelessWidget {
  final VoidCallback onTap;

  _ProceedingCard({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.nsp),
        child: ExpansionTile(
          key: key,
          childrenPadding: EdgeInsets.only(left: 5.nsp),
          // trailing: SizedBox.shrink(),
          // tilePadding: EdgeInsets.zero,
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            // height: 150.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hearing Pending",
                        style: AppTextStyles.s3(
                          fontType: FontType.BOLD,
                          color: AppColor.appRed,
                        ),
                      ),
                      SizedBox(height: 10.nsp),
                      Text(
                        "05 Jan 2021",
                        style: AppTextStyles.s2(fontType: FontType.LIGHT),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.nsp),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Adjourned to ',
                          style: AppTextStyles.s2(),
                          children: <TextSpan>[
                            TextSpan(
                              text: '05 Mar 2021',
                              style: AppTextStyles.s2(
                                  fontType: FontType.SEMI_BOLD),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(height: 10.nsp),
                      Text(
                        "Adv. John Snow",
                        style: AppTextStyles.s2(),
                      )
                    ],
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remarks: ",
                        style: AppTextStyles.s2(fontType: FontType.SEMI_BOLD),
                      ),
                      Expanded(
                        child: Text(
                          "Case filed on 26th december, evidence collected.",
                          style: AppTextStyles.s2(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.nsp),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _OptionButton(
                        icon: Icons.add,
                        backgroundColor: AppColor.primary,
                        title: "Add File",
                      ),
                      SizedBox(width: 10.nsp),
                      Expanded(
                        child: Wrap(
                          children: [
                            ...List.generate(
                              5,
                              (index) => Icon(
                                Icons.insert_drive_file_sharp,
                                color: AppColor.appSilver,
                                size: 80.nsp,
                              ),
                            ).toList()
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
