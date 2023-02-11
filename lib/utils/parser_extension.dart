extension ParserExtension on String {
  toType(Type type) {
    switch (type) {
      case String:
        return toString();
      case int:
        return int.parse(toString());
      case double:
        return double.parse(toString());
      default:
        return toString();
    }
  }
}
