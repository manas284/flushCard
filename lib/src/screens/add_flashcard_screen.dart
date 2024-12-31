import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/flashcard_provider.dart';
import '../models/flashcard.dart';

class AddFlashcardScreen extends StatelessWidget {
  const AddFlashcardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final questionController = TextEditingController();
    final answerController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Flashcard')),
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
                        .addFlashcard(
                      Flashcard(
                        question: questionController.text,
                        answer: answerController.text,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Flashcard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
