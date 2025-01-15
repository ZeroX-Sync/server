import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerScreen extends StatefulWidget {
  const PermissionHandlerScreen({Key? key}) : super(key: key);

  @override
  State<PermissionHandlerScreen> createState() => _PermissionHandlerScreenState();
}

class _PermissionHandlerScreenState extends State<PermissionHandlerScreen> {
  String _cameraPermissionStatus = '';
  String _locationPermissionStatus = '';

  Future<void> _requestPermissions() async {
    final cameraStatus = await Permission.camera.request();
    final locationStatus = await Permission.location.request();

    setState(() {
      _cameraPermissionStatus = cameraStatus.toString();
      _locationPermissionStatus = locationStatus.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permission Handler'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Camera Permission: $_cameraPermissionStatus'),
            Text('Location Permission: $_locationPermissionStatus'),
            ElevatedButton(
              onPressed: _requestPermissions,
              child: const Text('Request Permissions'),
            ),
          ],
        ),
      ),
    );
  }
}
