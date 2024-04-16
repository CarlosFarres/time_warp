import 'dart:math';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  LatLngFF? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    getCurrentUserLocation(defaultLocation:  const LatLngFF(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  //Funcino para calcular la distancia entre la ubicacion del usuario y del lugar
  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371.0; // Radio de la Tierra en kilómetros
    double dLat = _degreesToRadians(lat2 - lat1);
    double dLon = _degreesToRadians(lon2 - lon1);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;
    return distance;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitCircle(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return FutureBuilder<List<PlacesRow>>(
      future: PlacesTable().queryRows(
        queryFn: (q) => q,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<PlacesRow> homePagePlacesRowList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: const Color(0xFFC8D7E5),
              automaticallyImplyLeading: false,
              title: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Clogo-removebg-preview_(1).png',
                        width: 165.0,
                        height: 84.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.scan = await FlutterBarcodeScanner.scanBarcode(
                            '#C62828', // scanning line color
                            'Cancel', // cancel button text
                            true, // whether to show the flash icon
                            ScanMode.BARCODE,
                          );

                          context.pushNamed(
                            'Description',
                            queryParameters: {
                              'idPlace': serializeParam(
                                int.parse(_model.scan),
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );

                          setState(() {});
                        },
                        child: Icon(
                          Icons.qr_code_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 35.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    child: Container(
                      width: 380.0,
                      height: 388.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        border: Border.all(
                          width: 1.0,
                        ),
                      ),
                      child: Builder(builder: (context) {
                        final googleMapMarker = currentUserLocationValue;
                        return FutureBuilder<List<PlacesRow>>(
                        future: PlacesTable().queryRows(
                          queryFn: (q) => q,
                        ),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Scaffold(
                              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                              body: Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitCircle(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PlacesRow> homePagePlacesRowList = snapshot.data!;
                          List<FlutterFlowMarker> dynamicMarkers = homePagePlacesRowList.map((place) {
                            return FlutterFlowMarker(
                              place.idPlace.toString(),
                              LatLngFF(place.latitud!, place.longitud!),
                              () async {
                                context.pushNamed(
                                  'Description',
                                  queryParameters: {
                                    'idPlace': serializeParam(
                                      place.idPlace,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                            );
                          }).toList();

                          return FlutterFlowGoogleMap(
                            controller: _model.googleMapsController,
                            onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                            initialLocation: _model.googleMapsCenter ??= currentUserLocationValue!,
                            markers: dynamicMarkers.toSet(),
                            markerColor: GoogleMarkerColor.violet,
                            mapType: MapType.hybrid,
                            style: GoogleMapStyle.standard,
                            initialZoom: 14.0,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: true,
                            showLocation: true,
                            showCompass: false,
                            showMapToolbar: false,
                            showTraffic: false,
                            centerMapOnMarkerTap: true,
                          );
                        },
                      );

                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Near you',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 25.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                    child: Builder(
                      builder: (context) {
                        final List<PlacesRow> filteredPlaces = homePagePlacesRowList.where((place) {
                          double distance = calculateDistance(
                            currentUserLocationValue!.latitude,
                            currentUserLocationValue!.longitude,
                            place.latitud!,
                            place.longitud!,
                          );
                          return distance <= _model.sliderValue!;
                        }).toList();

                        if (filteredPlaces.isEmpty) {
                          return Text(
                            "No tienes ningún lugar a esa distancia",
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          );
                        }

                        return SizedBox(
                          width: double.infinity,
                          height: 141.0,
                          child: CarouselSlider.builder(
                            itemCount: filteredPlaces.length,
                            itemBuilder: (context, index, _) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'Description',
                                    queryParameters: {
                                      'idPlace': serializeParam(
                                        filteredPlaces[index].idPlace,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    filteredPlaces[index].photosActual!,
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            carouselController: _model.carouselController ??= CarouselController(),
                            options: CarouselOptions(
                              initialPage: min(1, filteredPlaces.length - 1),
                              viewportFraction: 0.5,
                              disableCenter: true,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.25,
                              enableInfiniteScroll: false,
                              scrollDirection: Axis.horizontal,
                              autoPlay: false,
                              onPageChanged: (index, _) => _model.carouselCurrentIndex = index,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Slider(
                    activeColor: FlutterFlowTheme.of(context).alternate,
                    inactiveColor: FlutterFlowTheme.of(context).primaryText,
                    min: 1.0,
                    max: 5.0,
                    value: _model.sliderValue ??= 1.0,
                    label: '${_model.sliderValue.toString()} km',
                    divisions: 4,
                    onChanged: (newValue) {
                      newValue = double.parse(newValue.toStringAsFixed(2));
                      setState(() => _model.sliderValue = newValue);
                    },
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
