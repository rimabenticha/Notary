import 'package:flutter/material.dart';

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
            // context.read<SearchCubit>().resetSearch();
          } else {
            // context.read<SearchCubit>().searchProduct(
            //   products: products,
            //   query: query,
            // );
          }
        },
        onSubmitted: (query) {
          if (query.isNotEmpty) {
            // context.read<SearchCubit>().searchProduct(
            //   products: products,
            //   query: query,
            // );
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
