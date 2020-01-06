class User {
  final String access_token;
  final String token_type;
  final int expires_in;
  final bool isFMCompany;
  final bool isSupplier;
  User({this.access_token, this.token_type, this.expires_in, this.isFMCompany, this.isSupplier});
  
  User.fromJson(Map<Object, dynamic> json) : access_token = json['data']['access_token'], this.token_type = json['data']['token_type'],
        this.expires_in = json['data']['expires_in'] , this.isFMCompany = json['data']['IsFMCompany'], this.isSupplier = json['data']['isSupplier'];

}
