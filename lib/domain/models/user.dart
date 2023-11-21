class User {
  final int id;
  final String email;
  final String enabled;
  final String phone;
  final String fullName;
  final String username;
  final String birthday;
  final List<String> roles;

  User({
    required this.id,
    required this.email,
    required this.enabled,
    required this.phone,
    required this.fullName,
    required this.username,
    required this.birthday,
    required this.roles,
  });
}
