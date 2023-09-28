import 'package:equatable/equatable.dart';

class GetContact {
  String name = '';
  String nomor = '';

  GetContact({
    required this.name,
    required this.nomor,
  });
}

class ContactState extends Equatable {
  List<GetContact> _contacts = [];
  ContactState(this._contacts);

  @override
  List<Object> get props => [_contacts];
}
