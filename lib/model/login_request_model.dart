class LoginRequest {
  final String username;
  final String password;

  LoginRequest(this.username, this.password);

  static Map<String, dynamic> toJson(LoginRequest user) => {
        'username': user.username,
        'password': user.password,
      };
}
