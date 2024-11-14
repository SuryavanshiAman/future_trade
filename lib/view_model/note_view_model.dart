import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/model/note_model.dart';
import 'package:future_trade/repo/note_repo.dart';

class NoteViewModel with ChangeNotifier {
  final _noteRepo = NoteRepository();
  NoteModel? _noteResponse;
  NoteModel? get noteResponse => _noteResponse;

  setNote(NoteModel response) {
    _noteResponse = response;
    notifyListeners();
  }

  Future<void> noteApi(BuildContext context) async {
    _noteRepo.noteApi().then((value) {
      if (value.status == 200) {
        setNote(value);
      } else {
        if (kDebugMode) {
          print('value: ${value.msg}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
