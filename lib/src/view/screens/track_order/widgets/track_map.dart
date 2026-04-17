import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:just_caffe/src/core/constants/app_assets.dart';

class TrackMap extends StatelessWidget {
  const TrackMap({super.key});

  @override
  Widget build(BuildContext context) {
    // Arbitrary coordinates for a simulated delivery route
    final storeLocation = const LatLng(37.7799, -122.4144);
    final userLocation = const LatLng(37.7749, -122.4094);
    final markerPoints = [
      storeLocation,
      const LatLng(37.7799, -122.4094),
      userLocation,
    ];

    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.grey,
        BlendMode.saturation,
      ),
      child: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(37.7770, -122.4110),
          initialZoom: 15.5,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.justcaffe.app',
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: markerPoints,
                color: const Color(0xffC67C4E),
                strokeWidth: 4.0,
              ),
            ],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: storeLocation,
                width: 40,
                height: 40,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: AppAssets.load(
                      SvgPath.bikeManIcon,
                      width: 20,
                      colorFilter: const ColorFilter.mode(
                        Color(0xffC67C4E),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              Marker(
                point: userLocation,
                width: 32,
                height: 32,
                child: const Icon(
                  Icons.location_on,
                  color: Color(0xffC67C4E),
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
