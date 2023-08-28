class ApiEndPoints {
  static final String baseUrl = 'https://cdim.xpertbotacademy.online';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = '/api/register';
  final String loginEmail = '/api/login';
}
