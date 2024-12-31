import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class FlashcardProvider with ChangeNotifier {
  final List<Flashcard> _flashcards = [];

  List<Flashcard> get flashcards => _flashcards;

  void addFlashcard(Flashcard flashcard) {
    _flashcards.add(flashcard);
    notifyListeners();
  }

  void updateFlashcard(int index, Flashcard flashcard) {
    _flashcards[index] = flashcard;
    notifyListeners();
  }

  void deleteFlashcard(int index) {
    _flashcards.removeAt(index);
    notifyListeners();
  }
}
