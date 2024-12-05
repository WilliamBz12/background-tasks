abstract class DeleteChecklistState {}

class DeleteChecklistInitial extends DeleteChecklistState {}

class DeleteChecklistSuccess extends DeleteChecklistState {
  final String itemId;
  DeleteChecklistSuccess(this.itemId);
}

class DeleteChecklistError extends DeleteChecklistState {
  final String message;
  DeleteChecklistError(this.message);
}
