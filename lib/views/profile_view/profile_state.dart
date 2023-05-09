part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileImageChangeSuccess extends ProfileState {}
class ProfileChangeInfo extends ProfileState {}

