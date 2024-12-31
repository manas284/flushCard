import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/flashcard_provider.dart';
import '../models/flashcard.dart';

class EditFlashcardScreen extends StatelessWidget {
  final int index;
  final Flashcard flashcard;

  const EditFlashcardScreen({
    super.key,
    required this.index,
    required this.flashcard,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final questionController = TextEditingController(text: flashcard.question);
    final answerController = TextEditingController(text: flashcard.answer);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Flashcard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: questionController,
                decoration: const InputDecoration(labelText: 'Question'),
                validator: (value) =>
                    value!.isEmpty ? 'Question cannot be empty' : null,
              ),
              TextFormField(
                controller: answerController,
                decoration: const InputDecoration(labelText: 'Answer'),
                validator: (value) =>
                    value!.isEmpty ? 'Answer cannot be empty' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Provider.of<FlashcardProvider>(context, listen: false)
                        .updateFlashcard(
                      index,
                      Flashcard(
                        question: questionController.text,
                        answer: answerController.text,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
