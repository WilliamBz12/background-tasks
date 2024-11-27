import '../../entities/shopping_item_entity.dart';

abstract class FetchChecklistState {}

class FetchChecklistLoading extends FetchChecklistState {}

class FetchChecklistLoaded extends FetchChecklistState {
  final List<ShoppingItemEntity> items;
  FetchChecklistLoaded(this.items);
}

class FetchChecklistError extends FetchChecklistState {
  final String message;
  FetchChecklistError(this.message);
}
