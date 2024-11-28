import '../../entities/shopping_item_entity.dart';

abstract class AddChecklistState {}

class AddChecklistInitial extends AddChecklistState {}

class AddChecklistSuccess extends AddChecklistState {
  final ShoppingItemEntity item;
  AddChecklistSuccess(this.item);
}

class AddChecklistError extends AddChecklistState {
  final String message;
  AddChecklistError(this.message);
}
