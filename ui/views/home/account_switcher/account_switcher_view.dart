import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proficient_lawyer/models/account.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/media/app_text_styles.dart';
import 'package:proficient_lawyer/ui/views/home/account_switcher/account_switcher_view_model.dart';
import 'package:proficient_lawyer/ui/widgets/button/text_button.dart';
import 'package:proficient_lawyer/ui/widgets/image_loaders/app_circular_image.dart';
import 'package:proficient_lawyer/ui/widgets/image_loaders/app_file_image.dart';
import 'package:proficient_lawyer/ui/widgets/image_loaders/app_network_image.dart';
import 'package:stacked/stacked.dart';

class AccountSwitcherView extends StatelessWidget {
  const AccountSwitcherView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountSwitcherViewModel>.reactive(
      builder: (context, model, child) => _Body(),
      viewModelBuilder: () => AccountSwitcherViewModel(),
    );
  }
}

class _Body extends ViewModelWidget<AccountSwitcherViewModel> {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, AccountSwitcherViewModel model) {
    return Center(
      child: PortalEntry(
        visible: model.portalVisibility,
        portal: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => model.onPortalTap(),
        ),
        child: PortalEntry(
          visible: model.portalVisibility,
          portalAnchor: Alignment.topRight,
          childAnchor: Alignment.bottomRight,
          child: InkWell(
            onTap: () => model.onPortalTap(),
            child: _AccountAvatar(),
          ),
          portal: Padding(
            padding: EdgeInsets.only(top: 5.nsp),
            child: Material(
              elevation: 8.nsp,
              borderRadius: BorderRadius.circular(8.nsp),
              child: Container(
                width: 240.nsp,
                padding:
                    EdgeInsets.symmetric(vertical: 5.nsp, horizontal: 10.nsp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...model.accounts
                        .map((e) => _AccountTile(
                              account: e,
                              onAccountSelect: (account) =>
                                  model.accountSelectAction(account),
                            ))
                        .toList(),
                    SizedBox(height: 5.nsp),
                    Divider(
                      height: 2.nsp,
                      color: AppColor.appSilver,
                    ),
                    SizedBox(height: 5.nsp),
                    _PopUpTile(
                      title: "Account Settings",
                      onTap: () => model.accountSettingsAction(),
                    ),
                    _PopUpTile(
                      title: "Subscription Management",
                      onTap: () => model.subscriptionManagementAction(),
                    ),
                    AppTextButton(
                      title: "${3} days left to Renew",
                      color: 3 <= 3 ? AppColor.appRed : AppColor.appGreen,
                      onTap: () => model.subscriptionManagementAction(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AccountAvatar extends StatelessWidget {
  final String imageAddress;
  final String imagePath;
  const _AccountAvatar({
    Key key,
    this.imageAddress,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16.nsp,
      backgroundColor: AppColor.appBg,
      child: AppCircularImage(
        radius: 16.nsp,
        child: imageAddress != null
            ? AppNetworkImage(
                url: imageAddress,
                fit: BoxFit.contain,
              )
            : imagePath != null
                ? AppFileImage(
                    filePath: imagePath,
                    fit: BoxFit.contain,
                  )
                : Icon(
                    Icons.account_balance_rounded,
                    color: AppColor.primary,
                  ),
      ),
    );
  }
}

class _AccountTile extends StatelessWidget {
  final Account account;
  final Function(Account) onAccountSelect;
  const _AccountTile({
    Key key,
    @required this.account,
    this.onAccountSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.nsp),
      child: InkWell(
        onTap: () => onAccountSelect?.call(account),
        child: Row(
          children: <Widget>[
            _AccountAvatar(
              imageAddress: account.imageUrl,
            ),
            SizedBox(width: 10.nsp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account.name,
                  style: AppTextStyles.s3(fontType: FontType.MEDIUM),
                ),
                SizedBox(height: 2.nsp),
                Text(
                  account.type,
                  style: AppTextStyles.s2(fontType: FontType.LIGHT),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _PopUpTile extends StatelessWidget {
  final String title;
  final Function onTap;
  const _PopUpTile({
    Key key,
    @required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.nsp),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyles.s2(),
            ),
          ],
        ),
      ),
    );
  }
}
