import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/flashcard_provider.dart';
import '../widgets/flashcard_tile.dart';
import 'add_flashcard_screen.dart';
import 'edit_flashcard_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final flashcards = Provider.of<FlashcardProvider>(context).flashcards;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcards'),
      ),
      body: flashcards.isEmpty
          ? const Center(child: Text('No flashcards available. Add some!'))
          : ListView.builder(
              itemCount: flashcards.length,
              itemBuilder: (context, index) {
                return FlashcardTile(
                  flashcard: flashcards[index],
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditFlashcardScreen(
                          index: index,
                          flashcard: flashcards[index],
                        ),
                      ),
                    );
                  },
                  onDelete: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Delete Flashcard'),
                        content: const Text('Are you sure you want to delete this flashcard?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<FlashcardProvider>(context, listen: false)
                                  .deleteFlashcard(index);
                              Navigator.pop(context);
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddFlashcardScreen()),
          );
        },
      ),
    );
  }
}
