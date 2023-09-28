import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum/Bloc/contact_event.dart';
import 'package:praktikum/Bloc/contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  String name = '';
  String nomor = '';
  ContactBloc() : super(ContactState(const [])) {
    on<AddContact>((event, emit) => emit(ContactState()));
  }
}
