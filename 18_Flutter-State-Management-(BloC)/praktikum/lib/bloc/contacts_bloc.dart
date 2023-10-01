import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum/Model/contacts_model.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactInitial(contact: [])) {
    on<AddContact>((event, emit) {
      state.contacts.add(event.contact);

      emit(ContactInitial(contact: state.contacts));
    });
    on<UpdateContact>((event, emit) {
      state.contacts[event.index] =
          GetContact(name: event.name, nomor: event.nomor);

      emit(ContactInitial(contact: state.contacts));
    });
    on<DeleteContact>((event, emit) {
      state.contacts.removeAt(event.index);

      emit(ContactInitial(contact: state.contacts));
    });
  }
}
