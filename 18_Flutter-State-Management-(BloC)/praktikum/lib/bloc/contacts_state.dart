part of 'contacts_bloc.dart';

abstract class ContactsState {
  final List<GetContact> contacts;
  ContactsState({required this.contacts});
}

class ContactInitial extends ContactsState {
  ContactInitial({required List<GetContact> contact})
      : super(contacts: contact);
}
