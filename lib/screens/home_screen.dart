import 'package:flutter/material.dart';
import 'package:learn_flutter/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  final Future<List> webtoons = ApiService.getTodaysToons();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          'Today\'s 툰s',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) => snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final webtoon = snapshot.data![index];
                  return ListTile(
                    leading: Image.network(webtoon.thumb),
                    title: Text(webtoon.title),
                    subtitle: Text(webtoon.id),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
