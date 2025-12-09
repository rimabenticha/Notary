import 'package:flutter/material.dart';
import 'package:noteary/features/home/presentation/views/widgets/custom_search_bar.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _SliverAppBarDelegate(
        child: Container(
          color: ThemeData().scaffoldBackgroundColor,
          child: const Padding(
            padding: EdgeInsets.only(right: 16, left: 16, bottom: 16, top: 28),
            child: CustomSearchBar(),
          ),
        ),
        height: 85,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _SliverAppBarDelegate({required this.child, required this.height});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
