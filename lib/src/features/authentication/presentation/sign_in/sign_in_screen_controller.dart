import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starter_architecture_flutter_firebase/src/features/authentication/data/firebase_auth_repository.dart';

class SignInScreenController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<void> signInAnonymously() async {
    final authRepository = ref.read(authRepositoryProvider);
    // state를 AsyncLoading으로 변경 후
    state = const AsyncLoading();
    // authRepository의 signInAnonymously 함수를 호출하여 익명로그인 구현, firebaseAuth.dart 참고
    state = await AsyncValue.guard(authRepository.signInAnonymously);

    // 인증상태가 변경되면, Stream<User?> authStateChanges() 를 listen하고 있는 GoRouterRefreshStream에서
    // notifyListeners()를 호출하여, GoRouter를 새로고침해 redirect를 수행한다.
  }
}

final signInScreenControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignInScreenController, void>(
        SignInScreenController.new);
