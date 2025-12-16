import 'package:flutter/material.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/features/profile/data/data_sources/privacy_policy_dummy_data.dart';
import 'package:noteary/features/profile/presentation/views/widgets/collapsable_content.dart';

class PrivacyPolicyScreenBody extends StatelessWidget {
  const PrivacyPolicyScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: kPadd16,
      child: CollapsableContent(data: privacyPolicyList),
    );
  }
}
