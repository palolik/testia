import 'package:flutter/material.dart';
import '/Data/Charector.dart';
import '/Data/api_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Character> characters = [];

  @override
  void initState() {
    super.initState();
    _fetchCharacters();
  }

  void _fetchCharacters() async {
    try {
      List<Character> fetchedCharacters = await fetchCharector();
      setState(() {
        characters = fetchedCharacters;
      });
    } catch (e) {
      print('Error fetching characters: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Don’t wrap in Scaffold — let parent screen handle that
    return characters.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Z Fighters (from main)',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 440,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return Card(
                elevation: 4,
                margin:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Image.network(
                          character.image,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              character.name,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Race: ${character.race}, Gender: ${character.gender}',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]),
                            ),
                            const SizedBox(height: 4),
                            Text('Ki: ${character.ki}',
                                style: const TextStyle(fontSize: 14)),
                            Text('Max Ki: ${character.maxKi}',
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
