import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class AccountModelData extends Equatable {
  final String? name;
  final String? email;
  final String? image;

  const AccountModelData({this.name, this.email, this.image});

  AccountModelData copyWith({
    String? name,
    String? email,
    String? image,
  }) {
    return AccountModelData(
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [name, email, image];
}
