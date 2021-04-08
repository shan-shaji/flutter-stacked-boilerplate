import 'package:flutter/material.dart';
import 'package:proficient_lawyer/app/router.gr.dart';
import 'package:proficient_lawyer/app/utils/toast_util.dart';
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/media/app_text_styles.dart';
import 'package:proficient_lawyer/ui/views/drawer/drawer_view_model.dart';
import 'package:proficient_lawyer/ui/widgets/title/title.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerViewModel>.reactive(
      builder: (context, model, child) => _Body(),
      viewModelBuilder: () => DrawerViewModel(),
    );
  }
}

class _Body extends ViewModelWidget<DrawerViewModel> {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, DrawerViewModel model) {
    return Drawer(
      child: Column(
        children: [
          _DrawerHead(
            userName: "Lawyer",
          ),
          Expanded(
            child: ListView(
              padding:
                  EdgeInsets.symmetric(horizontal: 10.nsp, vertical: 20.nsp),
              children: [
                _DrawerItem(
                  title: "Home",
                  icon: Icons.account_balance_rounded,
                  onTap: () => Navigator.pop(context),
                ),
                _DrawerItem(
                  title: "Schedules",
                  icon: Icons.event_rounded,
                  onTap: () => model.goToPage(Routes.scheduleScreenView),
                ),
                _DrawerItem(
                  title: "My Cases",
                  icon: Icons.library_books_outlined,
                  onTap: () => model.onCaseSelected(),
                ),
                _DrawerItem(
                  title: "Notes",
                  icon: Icons.event_note_rounded,
                  onTap: () => showToast(msg: "Feature yet to be implemented"),
                ),
                _DrawerItem(
                  title: "Contacts",
                  icon: Icons.contacts_outlined,
                  onTap: () => showToast(msg: "Feature yet to be implemented"),
                ),
                _DrawerItem(
                  title: "Refer and Earn",
                  icon: Icons.campaign_outlined,
                  onTap: () => showToast(msg: "Feature yet to be implemented"),
                ),
                _DrawerItem(
                  title: "Settings",
                  icon: Icons.settings_outlined,
                  onTap: () => showToast(msg: "Feature yet to be implemented"),
                ),
                _DrawerItem(
                  title: "FAQ\'s",
                  icon: Icons.question_answer_outlined,
                  onTap: () => showToast(msg: "Feature yet to be implemented"),
                ),
                _DrawerItem(
                  title: "Privacy Policy",
                  icon: Icons.verified_user_outlined,
                  onTap: () => showToast(msg: "Feature yet to be implemented"),
                ),
                _DrawerItem(
                  title: "Terms and Conditions",
                  icon: Icons.assignment_outlined,
                  onTap: () => showToast(msg: "Feature yet to be implemented"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerHead extends StatelessWidget {
  final String userName;
  const _DrawerHead({
    Key key,
    @required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      width: double.infinity,
      color: AppColor.primary,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              isUniqueTag: true,
            ),
            SizedBox(height: 20.nsp),
            RichText(
              text: TextSpan(
                text: 'welcome,  ',
                style: AppTextStyles.s3(color: AppColor.appBg),
                children: <TextSpan>[
                  TextSpan(
                    text: userName + " !",
                    style: AppTextStyles.s3(
                      color: AppColor.appBg,
                      fontType: FontType.SEMI_BOLD,
                    ),
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

class _DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const _DrawerItem({
    Key key,
    @required this.title,
    @required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: 10.nsp, vertical: 14.nsp),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20.nsp,
              color: AppColor.primary,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: AppTextStyles.s3(
                color: AppColor.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
