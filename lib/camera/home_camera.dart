import 'package:plantapp/camera/native_camera.dart';
import 'package:plantapp/camera/storage_helper.dart';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class FullPage extends StatefulWidget {
  const FullPage({super.key});

  @override
  State<FullPage> createState() => _FullPageState();
}

class _FullPageState extends State<FullPage> {
  File? _imageFile;
  bool _isSaving = false;

  Future<void> _requestPermission() async {
    await Permission.camera.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  Future<void> _takePicture() async {
    await _requestPermission();
    final File? result = await Navigator.push<File?>(
      context,
      MaterialPageRoute(builder: (_) => const CameraPage()),
    );
    if (result != null) {
      final saved = await StorageHelper.saveImage(result, 'camera');
      setState(() => _imageFile = saved);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Disimpan : ${saved.path}')));
    }
  }

  Future<void> _pickFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final saved = await StorageHelper.saveImage(File(picked.path), 'gallery');
      setState(() => _imageFile = saved);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Disalin : ${saved.path}')));
    }
  }

  Future<void> _saveImage() async {
    if (_imageFile == null) return;

    setState(() {
      _isSaving = true;
    });

    try {
      final saved = await StorageHelper.saveImage(_imageFile!, 'saved');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gambar disimpan di: ${saved.path}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan gambar: $e')),
      );
    } finally {
      setState(() {
        _isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Beranda")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Wrap Row dengan SingleChildScrollView agar tidak overflow garis kuning
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.camera),
                      label: const Text("Ambil Foto"),
                      onPressed: _takePicture,
                    ),
                    const SizedBox(width: 15),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.folder),
                      label: const Text("Pilih Dari Galeri"),
                      onPressed: _pickFromGallery,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              if (_imageFile != null)
                Expanded(
                  child: Column(
                    children: [
                      // Tampilkan gambar dengan ukuran terbatas agar tombol bisa terlihat
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.4,
                          maxWidth: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.file(
                          _imageFile!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Text(
                        "Gambar Disimpan Di: ${_imageFile!.path}",
                        style: const TextStyle(fontSize: 12),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(Icons.save),
                            label: _isSaving
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text("Simpan"),
                            onPressed: _isSaving ? null : _saveImage,
                          ),
                          const SizedBox(width: 15),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.delete),
                            label: const Text("Hapus Gambar"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () async {
                              await _imageFile?.delete();
                              setState(() => _imageFile = null);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Gambar Dihapus')),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              else
                const Text("Belum Ada Gambar Diambil/Dipilih"),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
