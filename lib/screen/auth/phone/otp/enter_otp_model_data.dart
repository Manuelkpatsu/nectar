import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class EnterOTPModelData extends Equatable {
  final int countDownTimeInSecs;

  const EnterOTPModelData({this.countDownTimeInSecs = 15});

  EnterOTPModelData copyWith({int? countDownTimeInSecs}) {
    return EnterOTPModelData(
      countDownTimeInSecs: countDownTimeInSecs ?? this.countDownTimeInSecs,
    );
  }

  @override
  List<Object?> get props => [countDownTimeInSecs];
}
