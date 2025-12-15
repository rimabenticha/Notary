import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/features/home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:noteary/features/home/presentation/manager/search_cubit/search_cubit.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, this.width});

  final double? width;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: widget.width,
      child: SearchBar(
        controller: _searchController,
        onChanged: (query) {
          if (query.isEmpty) {
            context.read<SearchCubit>().resetSearch();
          } else {
            context.read<SearchCubit>().searchNotes(
              notes: context.read<GetNotesCubit>().notes,
              query: query,
            );
          }
        },
        onSubmitted: (query) {
          if (query.isNotEmpty) {
            context.read<SearchCubit>().searchNotes(
              notes: context.read<GetNotesCubit>().notes,
              query: query,
            );
          }
        },
        hintText: 'Search...',
        hintStyle: const WidgetStatePropertyAll(TextStyle(color: Colors.black)),
        textStyle: const WidgetStatePropertyAll(TextStyle(color: Colors.black)),
        shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        leading: const Icon(Icons.search, color: Colors.black),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(Colors.grey.shade200),
      ),
    );
  }
}
