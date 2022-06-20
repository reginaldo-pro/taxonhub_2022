class CaptureErrors {
  CaptureErrors._();

  static int throwCodeErrors(Map<String, dynamic> map) {
    return (map['error'] as Map<String, dynamic>)['code'] as int;
  }
}
