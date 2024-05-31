import 'package:equatable/equatable.dart';

class UserProf extends Equatable {
  final String id;
  final String bgImg;
  final String userName;

  const UserProf(
      {required this.id, required this.bgImg, required this.userName});

  static List<UserProf> users = [
    UserProf(id: '1', bgImg: 'assets/profile/prof1.png', userName: "Manmeet"),
    UserProf(id: '2', bgImg: 'assets/profile/prof2.png', userName: "Dhawal"),
    UserProf(id: '3', bgImg: 'assets/profile/prof3.png', userName: "Ritish"),
    UserProf(id: '4', bgImg: 'assets/profile/prof4.png', userName: "Gurpreet"),
    UserProf(id: '5', bgImg: 'assets/profile/prof5.png', userName: "Children"),
  ];

  @override
  List<Object?> get props => [
        id,
        bgImg,
        userName,
      ];
}
