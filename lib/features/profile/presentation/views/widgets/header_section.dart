import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/core/utils/assets.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/features/profile/presentation/manager/update_personal_data_cubit/update_personal_data_cubit.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: MyColors.grey,
          foregroundImage: AssetImage(AssetsData.defaultAvatar),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            BlocBuilder<UpdatePersonalDataCubit, UpdatePersonalDataState>(
              builder: (context, state) {
                String fullName = getIt
                    .get<FirebaseAuth>()
                    .currentUser!
                    .displayName!;
                if (state is UpdatePersonalDataSuccess) {
                  fullName = state.user.displayName!;
                }
                return Text(
                  fullName,
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
            ),
            Text(getIt.get<FirebaseAuth>().currentUser?.email ?? ''),
          ],
        ),
      ],
    );
  }
}
