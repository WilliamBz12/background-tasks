import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/checklist_repository.dart';
import 'update_checklist_state.dart';

class UpdateChecklistCubit extends Cubit<UpdateChecklistState> {
  final ChecklistRepository _repository;

  UpdateChecklistCubit(this._repository) : super(UpdateChecklistInitial());

  Future<void> updateItem(
    String id, {
    String? title,
    bool? isCompleted,
  }) async {
    try {
      await _repository.updateItem(
        id: id,
        isCompleted: isCompleted,
        title: title,
      );
      emit(UpdateChecklistSuccess());
    } catch (e) {
      emit(UpdateChecklistError('Erro ao atualizar item: $e'));
    }
  }
}
