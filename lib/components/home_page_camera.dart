
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp/bloc_camera/camera_bloc.dart';
import 'package:plantapp/bloc_camera/camera_event.dart';
import 'package:plantapp/bloc_camera/camera_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Beranda")),
      body: SafeArea(
        child: BlocConsumer<CameraBloc, CameraState>(
          listener: (context, state) {
            if (state is CameraReady && state.snackbarMessage != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.snackbarMessage!)));
              context.read<CameraBloc>().add(
                ClearSnackbar(),
              ); // Clear the snackbar message
            }
          },
          builder: (context, state) {
            // final File? imageFile = state is CameraReady ? state.imageFile : null;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.camera),
                        label: const Text("Ambil Foto"),
                        onPressed: () {
                          final bloc = context.read<CameraBloc>();
                          if (bloc.state is! CameraReady) {
                            bloc.add(InitializeCamera());
                          }
                          bloc.add(OpenCameraAndCapture(context));
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    ElevatedButton.icon(
                      icon: Icon(Icons.folder),
                      label: const Text("Pilih Dari Galeri"),
                      onPressed:
                          () => context.read<CameraBloc>().add(
                            PickImageFromGallery(),
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                BlocBuilder<CameraBloc, CameraState>(
                  builder: (context, state) {
                    final imageFile =
                        state is CameraReady ? state.imageFile : null;

                    return imageFile != null
                        ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.file(
                                imageFile,
                                width: double.infinity,
                              ),
                            ),
                            Text("Gambar Disimpan Di : ${imageFile.path}"),
                            ElevatedButton.icon(
                              icon: const Icon(Icons.delete),
                              label: const Text("Hapus Gambar"),
                              onPressed:
                                  () => context.read<CameraBloc>().add(
                                    DeleteImage(),
                                  ),
                            ),
                          ],
                        )
                        : const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Belum Ada Gambar Diambil/Dipilih"),
                        );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}