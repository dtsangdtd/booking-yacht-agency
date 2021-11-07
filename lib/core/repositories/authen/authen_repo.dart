import 'package:booking_yatch_agency/core/models/authen_response_model.dart';

abstract class AuthenRepo {
  Future<AuthenResponse> signIn(String username, String password);
  Future<AuthenResponse> openSignIn(String idToken);
  Future<AuthenResponse> signUp(String name, String username, String password);
}
