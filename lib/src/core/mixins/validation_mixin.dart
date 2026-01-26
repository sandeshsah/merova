mixin ValidationMixin {
  String? validateEmail(String? v) {
    if (v == null || v.isEmpty) return "Email required";
    if (!v.contains("@")) return "Invalid email";
    return null;
  }
}
