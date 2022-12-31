import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_viewer_widget/map_viewer_widget.dart';
import 'package:vector_map_tiles/vector_map_tiles.dart';
import 'package:vector_tile_renderer/vector_tile_renderer.dart';
import 'package:vector_tile_renderer/vector_tile_renderer.dart' as vtr;

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

MapController mapController = MapController();

class _MapScreenState extends State<MapScreen> {
  String lokasi = "Kelurahan Kepuharjo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.keyboard_arrow_left),
          ),
        ),
        backgroundColor: appColor,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Lokasi Kelurahan',
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 600,
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  center: LatLng(-8.109537, 113.228671),
                  zoom: 15,
                  minZoom: 15,
                  maxZoom: 15,
                ),
                children: [
                  VectorTileLayer(
                    theme: _mapTheme(context),
                    tileProviders: TileProviders(
                      {'openmaptiles': _cachingTileProvider(_urlTemplate())},
                    ),
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(-8.109537, 113.228671),
                        builder: (context) => const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () async {
                  final intent = AndroidIntent(
                      action: 'action_view',
                      data: Uri.encodeFull(
                          'google.navigation:q=${lokasi.trim()}'),
                      package: 'com.google.android.apps.maps');
                  await intent.launch();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: appColor),
                      color: appColor),
                  child: Center(
                    child: Text(
                      "Temukan Lokasi di Maps",
                      textAlign: TextAlign.center,
                      style: poppinsMediumBlack.copyWith(color: whiteColor),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  vtr.Theme _mapTheme(BuildContext context) {
    return ProvidedThemes.lightTheme();
  }

  VectorTileProvider _cachingTileProvider(String urlTemplate) {
    return MemoryCacheVectorTileProvider(
      delegate: NetworkVectorTileProvider(
        urlTemplate: urlTemplate,
        maximumZoom: 14,
      ),
      maxSizeBytes: 1024 * 1024 * 2,
    );
  }

  String _urlTemplate() {
    return 'https://tile.openstreetmap.jp/data/planet/{z}/{x}/{y}.pbf';
  }
}
