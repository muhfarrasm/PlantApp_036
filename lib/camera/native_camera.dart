import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> _cameras;
  CameraController? _controller;
  int _selectedCameraIdx = 0;
  FlashMode _flashMode = FlashMode.off;
  double _zoom = 1.0;
  double _minZoom = 1.0;
  double _maxZoom = 1.0;
  bool _isZoomSupported = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _cameras = await availableCameras();
      await _setupCamera(_selectedCameraIdx);
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  Future<void> _setupCamera(int cameraIndex) async {
    try {
      final controller = CameraController(
        _cameras[cameraIndex],
        ResolutionPreset.high,
        enableAudio: false,
      );

      await controller.initialize();
      _minZoom = await controller.getMinZoomLevel();
      _maxZoom = await controller.getMaxZoomLevel();
      _isZoomSupported = _maxZoom > _minZoom;
      _zoom = _minZoom;
      await controller.setZoomLevel(_zoom);
      await controller.setFlashMode(_flashMode);

      if (mounted) {
        setState(() {
          _controller = controller;
          _selectedCameraIdx = cameraIndex;
        });
      }
    } catch (e) {
      debugPrint('Error setting up camera: $e');
    }
  }

  Future<void> _captureImage() async {
    try {
      if (_controller == null || !_controller!.value.isInitialized) return;
      final XFile file = await _controller!.takePicture();
      Navigator.pop(context, File(file.path));
    } catch (e) {
      debugPrint('Error capturing image: $e');
    }
  }

  void _switchCamera() {
    final nextIndex = (_selectedCameraIdx + 1) % _cameras.length;
    _setupCamera(nextIndex);
  }

  void _toggleFlash() async {
    final next = _flashMode == FlashMode.off
        ? FlashMode.auto
        : _flashMode == FlashMode.auto
            ? FlashMode.always
            : FlashMode.off;
    await _controller?.setFlashMode(next);
    setState(() => _flashMode = next);
  }

  void _setZoom(double value) async {
    if (!_isZoomSupported) return;
    _zoom = value.clamp(_minZoom, _maxZoom);
    await _controller?.setZoomLevel(_zoom);
    setState(() {});
  }

  IconData _getFlashIcon() {
    switch (_flashMode) {
      case FlashMode.auto:
        return Icons.flash_auto;
      case FlashMode.always:
        return Icons.flash_on;
      default:
        return Icons.flash_off;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          GestureDetector(
            onTapDown: (details) => _handleTap(details, context),
            child: CameraPreview(_controller!),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _circleButton(Icons.switch_camera, _switchCamera),
                _circleButton(Icons.camera, _captureImage, size: 70),
                _circleButton(_getFlashIcon(), _toggleFlash),
              ],
            ),
          ),
          _buildZoomControls(),
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap, {double size = 50}) {
    return ClipOval(
      child: Material(
        color: Colors.white24,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _handleTap(TapDownDetails details, BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    final offset = box.globalToLocal(details.globalPosition);
    final constraints = box.constraints;

    final normalizedOffset = Offset(
      offset.dx / constraints.maxWidth,
      offset.dy / constraints.maxHeight,
    );

    _controller?.setFocusPoint(normalizedOffset);
    _controller?.setExposurePoint(normalizedOffset);
  }

  Widget _buildZoomControls() {
    if (!_isZoomSupported) return const SizedBox.shrink();

    return Positioned(
      bottom: 140,
      left: 20,
      right: 20,
      child: Column(
        children: [
          Row(
            children: [
              _circleButton(Icons.looks_one, () => _setZoom(1.0), size: 44),
              const SizedBox(width: 10),
              if (_maxZoom >= 3.0)
                _circleButton(Icons.looks_3, () => _setZoom(3.0), size: 44),
              if (_maxZoom >= 5.0)
                _circleButton(Icons.looks_5, () => _setZoom(5.0), size: 44),
            ],
          ),
          Slider(
            value: _zoom,
            min: _minZoom,
            max: _maxZoom,
            divisions: ((_maxZoom - _minZoom) * 10).toInt(),
            label: '${_zoom.toStringAsFixed(1)}x',
            onChanged: _setZoom,
          ),
        ],
      ),
    );
  }
}
