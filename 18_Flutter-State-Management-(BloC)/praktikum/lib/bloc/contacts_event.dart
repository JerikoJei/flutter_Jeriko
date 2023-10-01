part of 'contacts_bloc.dart';

@immutable
abstract class ContactsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddContact extends ContactsEvent {
  final GetContact contact;
  AddContact({required this.contact});

  @override
  List<Object?> get props => [contact];
}

class UpdateContact extends ContactsEvent {
  final int index;
  final String name, nomor;
  UpdateContact({required this.index, required this.name, required this.nomor});

  @override
  List<Object?> get props => [index, name, nomor];
}

class DeleteContact extends ContactsEvent {
  final int index;
  DeleteContact({required this.index});

  @override
  List<Object?> get props => [index];
}
