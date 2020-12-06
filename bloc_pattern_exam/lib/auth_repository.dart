class AuthRepository {
  static final AuthRepository _authRepository = AuthRepository._internal();

  factory AuthRepository() {
    return _authRepository;
  }

  AuthRepository._internal();

  static bool authenticated = false;

  bool isUserAuthenticated() {
    return authenticated;
  }

  bool signInWithEmailAndPassword(String email, String password) {
    if (email == 'aaa@aaa.com' && password == 'aaa') {
      AuthRepository.authenticated = true;
      return true;
    } else {
      AuthRepository.authenticated = false;
      return false;
    }
  }

  bool registerWithEmailAndPassword(String email, String password) {
    return true;
  }
}
