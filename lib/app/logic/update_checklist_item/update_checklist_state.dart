abstract class UpdateChecklistState {}

class UpdateChecklistInitial extends UpdateChecklistState {}

class UpdateChecklistSuccess extends UpdateChecklistState {}

class UpdateChecklistError extends UpdateChecklistState {
  final String message;
  UpdateChecklistError(this.message);
}
