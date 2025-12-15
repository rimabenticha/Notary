import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/features/home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:noteary/features/home/presentation/views/home_screen.dart';
import 'package:noteary/features/profile/presentation/views/profile_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [const HomeScreen(), const ProfileScreen()];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    final getNotesCubit = context.read<GetNotesCubit>();

    await getNotesCubit.getNotes(
      uid: getIt.get<FirebaseAuth>().currentUser!.uid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: MyColors.lightBlue,
        height: 70,
        elevation: 0,
        selectedIndex: _selectedIndex,
        labelTextStyle: WidgetStateProperty.all(const TextStyle(fontSize: 14)),
        onDestinationSelected: _navigateBottomBar,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
