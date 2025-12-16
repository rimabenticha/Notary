import 'package:flutter/material.dart';
import 'package:noteary/core/styles/styles.dart';
import 'package:noteary/features/profile/data/models/expansion_model.dart';

class CollapsableContent extends StatefulWidget {
  const CollapsableContent({super.key, required this.data});

  final List<ExpansionModel> data;

  @override
  State<CollapsableContent> createState() => _CollapsableContentState();
}

class _CollapsableContentState extends State<CollapsableContent> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      dividerColor: Colors.transparent,
      elevation: 0,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          widget.data[index].isExpanded = !widget.data[index].isExpanded;
        });
      },
      children: widget.data.map<ExpansionPanel>((ExpansionModel item) {
        return ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(item.headerValue, style: Styles.textStyle18),
            );
          },
          body: Text(
            item.expandedValue,
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.normal),
          ),
          isExpanded: item.isExpanded,
          canTapOnHeader: true,
        );
      }).toList(),
    );
  }
}
