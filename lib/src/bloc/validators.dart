import 'dart:async';

class Validator {
  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      final emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

      if (emailValid.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Correo no valido');
      }
    },
  );

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError('Minimo 6 caracteres');
      }
    },
  );
}
