import 'dart:async';

import 'package:prep4life/app/course/saved_course_page.dart';
import 'package:prep4life/common_widgets/avatar.dart';
import 'package:prep4life/common_widgets/show_alert_dialog.dart';
import 'package:prep4life/common_widgets/show_exception_alert_dialog.dart';
import 'package:prep4life/constants/keys.dart';
import 'package:prep4life/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prep4life/services/firebase_auth_service.dart';

class AccountPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final FirebaseAuthService auth =
          Provider.of<FirebaseAuthService>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      await showExceptionAlertDialog(
        context: context,
        title: Strings.logoutFailed,
        exception: e,
      );
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final bool didRequestSignOut = await showAlertDialog(
          context: context,
          title: Strings.logout,
          content: Strings.logoutAreYouSure,
          cancelActionText: Strings.cancel,
          defaultActionText: Strings.logout,
        ) ??
        false;
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.accountPage),
        actions: <Widget>[
          FlatButton(
            key: Key(Keys.logout),
            child: Text(
              Strings.logout,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(130.0),
          child: _buildUserInfo(user,context),
        ),
      ),
    );
  }

  Widget _buildUserInfo(User user, BuildContext context) {
    return Column(
      children: [
        Avatar(
          photoUrl: user.photoUrl,
          radius: 50,
          borderColor: Colors.black54,
          borderWidth: 2.0,
        ),
        SizedBox(height: 8),
        if (user.displayName != null)
          Text(
            user.displayName,
            style: TextStyle(color: Colors.white),
          ),
        SizedBox(height: 8),
        FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SavedCoursePage(
                        courseId: 'qwe',
                      )));
            },
            child: Text('Saved'))
      ],
    );
  }
}
