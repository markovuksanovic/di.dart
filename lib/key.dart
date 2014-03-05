part of di;

class Key {
  final Type type;
  final Iterable<Type> _annotations;
  int _hashCode;

  Key(this.type, {Iterable<Type> annotations})
      : _annotations = annotations == null ? const [] : annotations;

  int get hashCode {
    if (_hashCode == null) {
      _hashCode = 629 + type.hashCode;
      _annotations.forEach((a) => _hashCode += a.hashCode);
    }
    return _hashCode;
  }

  bool operator==(other) {
    return other is Key &&
        other.type == type &&
        other._annotations.length == _annotations.length &&
        other._annotations.every(_annotations.contains);
  }

  String toString() {
    String asString = type.toString();
    return _annotations.isEmpty
        ? asString
        : asString + ' annotated with: [${_annotations.join(", ")}]';
  }
}