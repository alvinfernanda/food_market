part of 'models.dart';

class User extends Equatable{
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;

  User(
    {
      this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath,
    }
  );



  @override
  List<Object> get props => [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User mockUser = User(
  id: 1,
  name: 'Alvin Fernanda',
  email: 'alvinfernanda@gmail.com',
  address: 'Jalan Raya Tukdana',
  houseNumber: '12',
  phoneNumber: '08123456789',
  city: 'Indramayu',
  picturePath: 'https://icdn.football-espana.net/wp-content/uploads/2020/11/merlin_153612873_5bb119b9-8972-4087-b4fd-371cab8c5ba2-superJumbo.jpg'
);