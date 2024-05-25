class Profile {
  String? name;
  String? alamat;
  String? nohp;
  String? email;

  Profile({this.name, this.alamat, this.nohp, this.email});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      alamat: json['alamat'],
      nohp: json['nohp'], 
      email: json['email'],
    );


  }
}
