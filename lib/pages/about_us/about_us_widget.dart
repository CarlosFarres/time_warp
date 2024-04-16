import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'about_us_model.dart';
export 'about_us_model.dart';

class AboutUsWidget extends StatefulWidget {
  const AboutUsWidget({super.key});

  @override
  State<AboutUsWidget> createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
  late AboutUsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutUsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
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
                    width: 1655.0,
                    height: 84.0,
                    fit: BoxFit.contain,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'About Us',
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Urbanist',
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(40.0, 15.0, 40.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          'TIMEWARP application is a cultural and educational platform that uses the reading of QR codes and user location to allow them to explore and learn about places historical. The app focuses on providing a new perspective by showing how were the places at different times, allowing users to compare the past with the present.',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(40.0, 15.0, 40.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          'Main Features:\n1. Exploration of Historical Places:\n- Users can explore historical places by scanning QR codes located on\nbuildings or monuments, or by searching on the app\'s map.\n2. Detailed Information:\n- Each historical place has an extensive database that provides information\ndetailed about its history, architecture and significant events.\n- By scanning the QR code, users can access historical data, photographs\nold stories and stories about the place.\n3. Comparison Before and After:\n- The app features a comparison feature that simultaneously shows the view\ncurrent and historical of the place, allowing users to easily visualize the\ndifferences over time.\n- Users can slide a bar to switch between current and historical view and\nobserve the transformations.\n4. Interactive Map:\n- The application has an interactive map that shows the location of all the\nhistorical places available.\n- Users can explore different places on the map, get quick information and\nDecide which site you want to visit.\n5. Thematic Routes:\n- The application offers themed routes that allow users to take tours\nspecific, such as \"Ancient Architecture\", \"Historical Events\" or \"Transformations\nUrban\".\n- Each thematic route provides an educational experience focused on a specific topic.\n\nWith the TIMEWARP app, users not only explore historical places, but\nThey also immerse themselves in the rich history of their city or one abroad, promoting\neducation, cultural appreciation and historical awareness.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ].addToEnd(const SizedBox(height: 64.0)),
            ),
          ),
        ),
      ),
    );
  }
}
