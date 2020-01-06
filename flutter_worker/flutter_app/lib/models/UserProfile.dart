class UserProfile {
  final int id;
  final int organisationId;
  final String name;
  final String email;
  final String password;
  final bool active;

  UserProfile({this.id, this.organisationId, this.name, this.email, this.password, this.active});

  factory UserProfile.fromJson(Map<String, dynamic> json){
    return UserProfile(
      id: json['id'],
      organisationId: json['organisationId'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      active: json['active']
    );
  }
}