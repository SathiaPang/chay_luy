import 'package:chay_luy/domain/db/remote.dart';
import 'package:chay_luy/ext/string.dart';
import 'package:chay_luy/models/user/user.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:uuid/uuid.dart';

class AppRepo {
  final _uuid = Uuid();

  Future<bool> signup(User user) async {
    final data = user.copyWith(id: _uuid.v1());
    try {
      FirestoreDatabase.userTable.doc(data.id).set(data.toJson());
      return true;
    } catch (ex) {
      ex.printError();
      return false;
    }
  }

  Future<bool> isEmailRegistered(String email) async {
    try {
      final result = await FirestoreDatabase.userTable
          .where("email", isEqualTo: email)
          .get();
      if (result.docs.isEmpty)
        return false;
      else
        return true;
    } catch (ex) {
      ex.printError();
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final result = await FirestoreDatabase.userTable
          .where("email", isEqualTo: email)
          .where("password", isEqualTo: password.hashPassword())
          .get();
      if (result.docs.isEmpty)
        return false;
      else
        return true;
    } catch (ex) {
      ex.printError();
      return false;
    }
  }

  Future<bool> changePassword(User user, String newPassword) async {
    try {
      final result = await FirestoreDatabase.userTable
          .where("email", isEqualTo: user.email)
          .get();
      FirestoreDatabase.userTable
          .doc(result.docs.first.id)
          .update({"password": newPassword.hashPassword()});
      return true;
    } catch (ex) {
      ex.printError();
      return false;
    }
  }
}
