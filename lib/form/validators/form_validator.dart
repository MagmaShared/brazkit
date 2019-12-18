
class BrazFormValidatorKit {

  static String validateEmail(String text, {String errorEmpty, String errorInvalid}) {

    if (text.isEmpty) return errorEmpty ?? "Informe o email";
    if (text.length < 6) return errorInvalid ?? "Email inválido.";
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text)) return errorInvalid ?? "Email inválido.";

    return null;
  }

  static String validatePassword(String text, {int minLength = 6, String errorEmpty, String errorLength}) {

    if (text.isEmpty) return errorEmpty ?? "Informe a senha";
    if (text.length < minLength) return errorLength ?? "Senha precisa ter $minLength ou mais caracteres";

    // TODO fazer mais validações

    return null;
  }

  static String validateAlphaNumeric(String text, {int maxLength = 9999, int minLength = 0, String errorRequired, String errorMaxLength, String errorMinLength, String errorValidChars}) {

    if (text.isEmpty) return errorRequired ?? "Este campo é obrigatório";
    if (text.length > maxLength) return errorMaxLength ?? "Este campo aceita no máximo $maxLength caracteres";
    if (text.length < minLength) return errorMinLength ?? "Este campo aceita no mínimo $minLength caracteres";

    final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
    if (!validCharacters.hasMatch(text)) return errorValidChars ?? 'Caracteres inválidos, use apenas letras ou números';

    return null;
  }

  static String validateName(String text, {String error}) {
    if (text.isEmpty) return error ?? "Informe o nome";
    return null;
  }

  static String validateUrl(String url, {String error}) {
  var urlPattern = r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
  var match = RegExp(urlPattern, caseSensitive: false).firstMatch(url);
  return match != null ? null : error ?? 'Informe uma URL válida.';
}

}



