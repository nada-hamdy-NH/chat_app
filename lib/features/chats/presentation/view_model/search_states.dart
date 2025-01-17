class SearchState {
  final bool isSearching;
  final List<dynamic> searchList;

  SearchState({
    this.isSearching = false,
    this.searchList = const [],
  });

  SearchState copyWith({
    bool? isSearching,
    List<dynamic>? searchList,
  }) {
    return SearchState(
      isSearching: isSearching ?? this.isSearching,
      searchList: searchList ?? this.searchList,
    );
  }

}
class OnChangeMode extends SearchState{
   bool isChangeMode = false ;

  OnChangeMode({ required this.isChangeMode }) ;
}  