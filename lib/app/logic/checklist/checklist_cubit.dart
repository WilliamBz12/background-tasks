import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/checklist_repository.dart';
import 'checklist_state.dart';

class FetchChecklistCubit extends Cubit<FetchChecklistState> {
  final ChecklistRepository _repository;

  FetchChecklistCubit(this._repository) : super(FetchChecklistLoading());

  Future<void> fetchItems() async {
    try {
      final items = await _repository.fetchAll();
      emit(FetchChecklistLoaded(items));
    } catch (e) {
      emit(FetchChecklistError('Erro ao carregar itens: $e'));
    }
  }
}
