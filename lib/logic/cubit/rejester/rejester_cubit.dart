import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rejester_state.dart';

class RejesterCubit extends Cubit<RejesterState> {
  RejesterCubit() : super(RejesterInitial()) {}
  final _outh = FirebaseAuth.instance;

  Future<void> checemailverifi() async {
    final user = _outh.currentUser;

    if (user != null) {
      await user.reload();
      if (user.emailVerified) {
        emit(EmailVerifii());
      } else {
        emit(Rejestersucess());
      }
    }
  }

  Future<void> rejesterUSer({
    required String email,
    required String password,
  }) async {
    emit(RejesterLOding());
    try {
      await _outh.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(Rejestersucess());
      _outh.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RejesterIError(messige: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(
          RejesterIError(messige: 'The account already exists for that email.'),
        );
      } else {
        emit(RejesterIError(messige: "${e.code} ${e.message}"));
        print(
          "================================================================== ${e.code} ${e.message} =====",
        );
      }
    } catch (ex) {
      emit(RejesterIError(messige: "$ex"));
    }
  }
}
