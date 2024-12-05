import 'package:flutter_bloc/flutter_bloc.dart';
import '../../entities/shopping_item_entity.dart';
import '../../repositories/checklist_repository.dart';
import 'add_checklist_state.dart';

class AddChecklistCubit extends Cubit<AddChecklistState> {
  final ChecklistRepository _repository;

  AddChecklistCubit(this._repository) : super(AddChecklistInitial());

  Future<void> addItem(ShoppingItemEntity item) async {
    try {
      await _repository.addItem(item);
      emit(AddChecklistSuccess(item));
    } catch (e) {
      emit(AddChecklistError('Erro ao adicionar item: $e'));
    }
  }
}
