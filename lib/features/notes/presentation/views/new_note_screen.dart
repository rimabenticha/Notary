import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:noteary/core/styles/colors.dart';
import 'package:noteary/core/styles/sizes.dart';
import 'package:noteary/core/utils/functions/custom_snack_bar.dart';
import 'package:noteary/core/utils/service_locator.dart';
import 'package:noteary/features/notes/data/models/note_model.dart';
import 'package:noteary/features/notes/data/repos/notes_repo_impl.dart';
import 'package:noteary/features/notes/presentation/manager/save_note_cubit/save_note_cubit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:uuid/uuid.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  late SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    PermissionStatus status = await Permission.microphone.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      debugPrint('Microphone permission denied');
      if (mounted) {
        // customSnackBar(
        //   context: context,
        //   message: 'يرجى السماح بالوصول إلى الميكروفون من الإعدادات',
        //   success: false,
        // );
      }
      return;
    }
    _speech = SpeechToText();
    bool available = await _speech.initialize();
    if (available) {
      setState(() {
        _isListening = false;
      });
    }
  }

  Future<void> _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => log('onStatus: $val'),
        onError: (val) => log('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          listenFor: const Duration(minutes: 2),
          onResult: (result) {
            setState(() {
              _text = result.recognizedWords;
            });
            if (result.finalResult) {
              stopListening();
            }
          },
        );
      }
    }
    setState(() => _isListening = true);
  }

  void stopListening() {
    if (_isListening) {
      _speech.stop();
      setState(() {
        _isListening = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveNoteCubit(getIt.get<NotesRepoImpl>()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  // label: Text('Title'),
                  hintText: 'Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title!';
                  }
                  return null;
                },
              ),
              actions: [
                BlocListener<SaveNoteCubit, SaveNoteState>(
                  listener: (context, state) {
                    if (state is SaveNoteLoading) {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is SaveNoteSuccess) {
                      context.pop();
                      context.pop();
                      customSnackBar(
                        context: context,
                        message: 'Note saved successfully!',
                        success: true,
                      );
                    } else if (state is SaveNoteFailure) {
                      context.pop();
                      customSnackBar(
                        context: context,
                        message: state.errMessage,
                        success: false,
                      );
                    }
                  },
                  child: IconButton(
                    onPressed: () {
                      if (_titleController.text.isEmpty) {
                        customSnackBar(
                          context: context,
                          message: 'Please enter a title!',
                          success: false,
                        );
                        return;
                      }
                      if (_text == 'Press the button and start speaking') {
                        customSnackBar(
                          context: context,
                          message: 'Please start speaking!',
                          success: false,
                        );
                        return;
                      }
                      context.read<SaveNoteCubit>().saveNote(
                        note: NoteModel(
                          id: getIt.get<Uuid>().v4(),
                          uid: getIt.get<FirebaseAuth>().currentUser?.uid,
                          title: _titleController.text,
                          content: _text,
                          createdAt: DateTime.now(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.save, size: 30),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              reverse: true,
              padding: kPadd16,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    _text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: SizedBox(
              width: 80,
              height: 80,
              child: FloatingActionButton(
                onPressed: _listen,
                backgroundColor: _isListening == true
                    ? Colors.red
                    : MyColors.pruple,
                shape: const CircleBorder(),
                child: const Icon(Icons.mic, size: 36, color: MyColors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
