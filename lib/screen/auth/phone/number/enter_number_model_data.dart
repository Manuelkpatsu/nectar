import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class EnterNumberModelData extends Equatable {
  final String countryCode;
  final String countryDialCode;

  const EnterNumberModelData({
    this.countryCode = 'GH',
    this.countryDialCode = '+233',
  });

  EnterNumberModelData copyWith({
    String? countryCode,
    String? countryDialCode,
  }) {
    return EnterNumberModelData(
      countryCode: countryCode ?? this.countryCode,
      countryDialCode: countryDialCode ?? this.countryDialCode,
    );
  }

  @override
  List<Object?> get props => [countryCode, countryDialCode];
}
