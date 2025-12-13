import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/core/utils/app_router.dart';
import 'package:noteary/features/notes/data/models/note_model.dart';

class HomeGridViewItem extends StatelessWidget {
  const HomeGridViewItem({super.key, required this.note, required this.index});

  final NoteModel note;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRouter.kNoteConentScreen),
      child: Card(
        color: [
          MyColors.lightPurple,
          MyColors.lightBlue,
          MyColors.yellow,
          MyColors.pruple,
        ][index % 4],
        child: Padding(
          padding: kPadd8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title!,
                style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                note.content!,
                style: Styles.textStyle16.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
