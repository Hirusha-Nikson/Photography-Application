// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class homeShortcuts extends StatelessWidget {
  const homeShortcuts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.46,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)),
                color: Theme.of(context).colorScheme.background,
                //border: Border.all(
                //color: Theme.of(context).colorScheme.inversePrimary),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 126, 126, 126),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Text("He'd have you all unravel at the"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 160, 134, 134),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Text('Heed not the rabble'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(255, 137, 107, 194),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Text('Sound of screams but the'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 74, 150, 141),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Text('Who scream'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.indigo.shade500,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Text('Revolution is coming...'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.purple.shade500,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Text('Revolution, they...'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green.shade500,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Text('Sound of screams but the'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.lightBlue.shade500,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Text('Who scream'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.red.shade500,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Text('Revolution is coming...'),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.teal[600],
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Text('Revolution, they...'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
