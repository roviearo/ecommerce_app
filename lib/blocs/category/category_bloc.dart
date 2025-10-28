import 'package:ecommerce_app/repositories/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc({required CategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository,
      super(Initial()) {
    on<LoadAllCategoryEvent>(_onLoadAllCategoryEvent);
  }

  _onLoadAllCategoryEvent(
    LoadAllCategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    try {
      emit(const CategoryLoading());
      final listCategory = await _categoryRepository.getAllCategory();
      emit(AllCategoryLoaded(listCategory: listCategory));
    } catch (e) {
      emit(CategoryError(messages: e.toString()));
    }
  }
}
