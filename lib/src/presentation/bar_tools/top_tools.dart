// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/control_provider.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/draggable_widget_notifier.dart';
import 'package:vs_story_designer/src/domain/providers/notifiers/painting_notifier.dart';
import 'package:vs_story_designer/src/presentation/utils/modal_sheets.dart';
import 'package:vs_story_designer/src/presentation/widgets/tool_button.dart';

class TopTools extends StatefulWidget {
  final GlobalKey contentKey;
  final BuildContext context;

  const TopTools({
    super.key,
    required this.contentKey,
    required this.context,
  });

  @override
  _TopToolsState createState() => _TopToolsState();
}

class _TopToolsState extends State<TopTools> {
  @override
  Widget build(BuildContext context) {
    return Consumer3<ControlNotifier, PaintingNotifier,
        DraggableWidgetNotifier>(
      builder: (_, controlNotifier, paintingNotifier, itemNotifier, __) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// close button
                ToolButton(
                    backGroundColor: Colors.black12,
                    onTap: () async {
                      exitDialog(
                              context: widget.context,
                              contentKey: widget.contentKey,
                              themeType: controlNotifier.themeType)
                          .then((res) {
                        if (res) Navigator.pop(context);
                      });
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),

                Row(
                  children: [
                    ToolButton(
                      backGroundColor: Colors.black12,
                      onTap: () => controlNotifier.isTextEditing =
                          !controlNotifier.isTextEditing,
                      child: const ImageIcon(
                        AssetImage('assets/icons/text.png',
                            package: 'vs_story_designer'),
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    ToolButton(
                      backGroundColor: controlNotifier.enableTextShadow
                          ? Colors.white
                          : Colors.black12,
                      onTap: () {
                        controlNotifier.enableTextShadow =
                            !controlNotifier.enableTextShadow;
                      },
                      child: Icon(Icons.text_fields_sharp,
                          color: controlNotifier.enableTextShadow
                              ? Colors.black
                              : Colors.white,
                          size: 30),
                    ),
                    ToolButton(
                      backGroundColor: Colors.black12,
                      onTap: () {
                        controlNotifier.isPainting = true;
                        //createLinePainting(context: context);
                      },
                      child: const ImageIcon(
                        AssetImage('assets/icons/draw.png',
                            package: 'vs_story_designer'),
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
