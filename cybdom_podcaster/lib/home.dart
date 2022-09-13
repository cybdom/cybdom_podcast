import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _didSelectAFile = false;
  String? _title, _author;
  PlatformFile? _file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "Author"),
                onChanged: (value) => setState(() {
                  _author = value;
                }),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Podcast Title"),
                onChanged: (value) => setState(() {
                  _title = value;
                }),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: _file != null
                              ? _file!.path
                              : "Please select an image."),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.image,
                      );

                      if (result != null) {
                        setState(() {
                          _file = result.files.first;
                          _didSelectAFile = true;
                        });
                      } else {}
                    },
                    icon: const Icon(Icons.upload),
                  )
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_didSelectAFile && _title != null && _author != null) {
                    _upload(
                        context: context,
                        author: _author!,
                        uploadFile: _file!,
                        title: _title!);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Make sure you file everything!"),
                      ),
                    );
                  }
                },
                child: const Text("Start Podcast"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _upload(
      {required BuildContext context,
      required PlatformFile uploadFile,
      required String author,
      required String title}) async {
    File file = File(uploadFile.path!);
    final stream = http.ByteStream(file.openRead());
    final length = await file.length();
    var uri = Uri.parse("http://localhost:1337/api/podcasts");
    var multipartFile = http.MultipartFile('files.image', stream, length,
        filename: uploadFile.name,
        contentType: MediaType('image', uploadFile.extension!));
    var request = http.MultipartRequest("POST", uri)
      ..fields["data"] = jsonEncode({})
      ..files.add(multipartFile);
    var res = await request.send();

    if (res.statusCode == 200) {
      res.stream.transform(utf8.decoder).listen((value) async {
        final req = await http.put(
            Uri.parse(
                "http://localhost:1337/api/podcasts/${jsonDecode(value)['data']['id']}"),
            body: jsonEncode(
              {
                "data": {
                  "title": title,
                  "author": author,
                }
              },
            ),
            headers: {"content-type": "application/json"});
        final result = jsonDecode(req.body);
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "You can start streaming now!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Text("Copy these information to OBS."),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Stream URL",
                    ),
                    controller: TextEditingController(
                        text: "rtmps://global-live.mux.com:443/app"),
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: "Stream Key"),
                    controller: TextEditingController(
                        text: result["data"]["attributes"]["streamKey"]),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something bad happened, please try again!"),
        ),
      );
    }
  }
}
