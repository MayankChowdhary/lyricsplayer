import 'package:flutter/material.dart';

import '../../../data/models/song_details_model.dart';

class SongDetailView extends StatelessWidget {
  const SongDetailView(this.model, {super.key});

  final SongDetailModel? model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name:",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("${model?.message?.body?.track?.trackName}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 22)),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Album Name:",
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("${model?.message?.body?.track?.albumName}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 22)),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Artist Name:",
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("${model?.message?.body?.track?.artistName}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 22)),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Explicit",
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("${model?.message?.body?.track?.explicit}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 22)),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Rating",
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("${model?.message?.body?.track?.trackRating}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 22)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
