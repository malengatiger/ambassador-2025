
import 'package:json_annotation/json_annotation.dart';

import 'data_schemas.dart';
part 'ticket.g.dart';

@JsonSerializable(explicitToJson: true)
class Ticket {
  String? associationId, associationName, userId;
  String? routeId, ticketId, commuterId, commuterEmail, commuterCellphone;
  double? value;
  String? validFrom, validTo;

  TicketType? ticketType;


  Ticket(
      this.associationId, this.userId,
      this.associationName,
      this.routeId,
      this.ticketId,
      this.commuterId,
      this.commuterEmail,
      this.commuterCellphone,
      this.value,
      this.validFrom,
      this.validTo,
      this.ticketType);

  factory Ticket.fromJson(Map<String, dynamic> json) =>
      _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TicketPunched {
  String? ticketId, commuterId, date, userId, associationId;


  TicketPunched(this.ticketId, this.commuterId, this.date, this.userId,
      this.associationId);

  factory TicketPunched.fromJson(Map<String, dynamic> json) =>
      _$TicketPunchedFromJson(json);

  Map<String, dynamic> toJson() => _$TicketPunchedToJson(this);

}

enum TicketType {
  daily,
  weekly, monthly, annual;
}
