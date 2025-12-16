import 'package:flutter/material.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/features/profile/data/data_sources/faq_dummy_data.dart';
import 'package:noteary/features/profile/presentation/views/widgets/collapsable_content.dart';

class FaqScreenBody extends StatelessWidget {
  const FaqScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: kPadd16,
      child: CollapsableContent(data: faqList),
    );
  }
}
