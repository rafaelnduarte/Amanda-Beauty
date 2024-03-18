import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/artist_filter_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_calendar_model.dart';
export 'home_calendar_model.dart';

class HomeCalendarWidget extends StatefulWidget {
  const HomeCalendarWidget({super.key});

  @override
  State<HomeCalendarWidget> createState() => _HomeCalendarWidgetState();
}

class _HomeCalendarWidgetState extends State<HomeCalendarWidget>
    with TickerProviderStateMixin {
  late HomeCalendarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeCalendarModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Home_Calendar'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_CALENDAR_Home_Calendar_ON_INIT_STAT');
      logFirebaseEvent('Home_Calendar_update_page_state');
      setState(() {
        _model.selectedMonth = dateTimeFormat(
          'MMM',
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        );
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        drawer: Container(
          width: 220.0,
          child: Drawer(
            elevation: 16.0,
            child: Container(
              width: 100.0,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 250.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).isabelline,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 60.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 90.0,
                              height: 90.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                currentUserPhoto,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 15.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              currentUserDisplayName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                          ),
                        ),
                        Text(
                          currentUserEmail,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'HOME_CALENDAR_ListTile_38luuweu_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed('Artist_Profile');
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.person_rounded,
                              color: FlutterFlowTheme.of(context).timberwolf,
                              size: 30.0,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'fq0uivmu' /* Artist Profile */,
                              ),
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            subtitle: Text(
                              FFLocalizations.of(context).getText(
                                '2ax9riwm' /* Settings */,
                              ),
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'HOME_CALENDAR_ListTile_64s6d4ff_ON_TAP');
                            logFirebaseEvent('ListTile_auth');
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth('Auth_Login', context.mounted);
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.logout,
                              color: FlutterFlowTheme.of(context).timberwolf,
                              size: 30.0,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                'hxkompux' /* Logout */,
                              ),
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).timberwolf),
            automaticallyImplyLeading: true,
            title: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'HOME_CALENDAR_PAGE_NEW_EVENT_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('create_event');
                    },
                    text: FFLocalizations.of(context).getText(
                      'pccifuib' /* New Event */,
                    ),
                    icon: Icon(
                      Icons.edit_calendar,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 0.0, 8.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '4csuibl2' /* Calendar */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [],
            centerTitle: true,
            toolbarHeight: double.infinity,
            elevation: 4.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: true,
                      isScrollable: true,
                      labelStyle: FlutterFlowTheme.of(context).titleMedium,
                      unselectedLabelStyle: TextStyle(),
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      unselectedBackgroundColor:
                          FlutterFlowTheme.of(context).alternate,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 12.0,
                      elevation: 0.0,
                      labelPadding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                      tabs: [
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'b2g61d3b' /* All Events */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '7c0wck3n' /* Upcoming */,
                          ),
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'n72tcr95' /* Events */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        FlutterFlowCalendar(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          weekFormat: false,
                                          weekStartsMonday: false,
                                          initialDate: getCurrentTimestamp,
                                          onChange: (DateTimeRange?
                                              newSelectedDate) async {
                                            if (_model.calendarSelectedDay ==
                                                newSelectedDate) {
                                              return;
                                            }
                                            _model.calendarSelectedDay =
                                                newSelectedDate;
                                            logFirebaseEvent(
                                                'HOME_CALENDAR_Calendar_nc8df1x7_ON_DATE_');
                                            logFirebaseEvent(
                                                'Calendar_update_page_state');
                                            setState(() {
                                              _model.selectedDate = _model
                                                  .calendarSelectedDay?.start;
                                            });
                                            setState(() {});
                                          },
                                          titleStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge,
                                          dayOfWeekStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          dateStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          selectedDateStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall,
                                          inactiveDateStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.84, -1.01),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.7,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    StreamBuilder<List<EventsRecord>>(
                                      stream: queryEventsRecord(
                                        queryBuilder: (eventsRecord) =>
                                            eventsRecord
                                                .where(
                                                  'artists',
                                                  arrayContains:
                                                      currentUserReference,
                                                )
                                                .where(
                                                  'date',
                                                  isGreaterThan:
                                                      getCurrentTimestamp,
                                                )
                                                .orderBy('date'),
                                        limit: 30,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<EventsRecord>
                                            containerEventsRecordList =
                                            snapshot.data!;
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'dap283ha' /* Filter */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              icon: Icon(
                                                Icons.filter_list,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'HOME_CALENDAR_filter_list_ICN_ON_TAP');
                                                logFirebaseEvent(
                                                    'IconButton_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            ArtistFilterWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              icon: Icon(
                                                Icons.clear,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'HOME_CALENDAR_PAGE_clear_ICN_ON_TAP');
                                                logFirebaseEvent(
                                                    'IconButton_update_app_state');
                                                setState(() {
                                                  FFAppState().filterArtist =
                                                      null;
                                                });
                                                logFirebaseEvent(
                                                    'IconButton_update_page_state');
                                                setState(() {
                                                  _model.selectedDate = null;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (_model.selectedDate == null) {
                                          return Builder(
                                            builder: (context) {
                                              if (FFAppState().filterArtist ==
                                                  null) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<EventsRecord>>(
                                                    stream: queryEventsRecord(
                                                      queryBuilder:
                                                          (eventsRecord) =>
                                                              eventsRecord
                                                                  .where(
                                                        'artists',
                                                        arrayContains:
                                                            currentUserReference,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<EventsRecord>
                                                          containerEventsRecordList =
                                                          snapshot.data!;
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final data = containerEventsRecordList
                                                                  .where((e) =>
                                                                      dateTimeFormat(
                                                                        'MMM',
                                                                        e.date,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ) ==
                                                                      dateTimeFormat(
                                                                        'MMM',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))
                                                                  .toList();
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    data.length,
                                                                itemBuilder:
                                                                    (context,
                                                                        dataIndex) {
                                                                  final dataItem =
                                                                      data[
                                                                          dataIndex];
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_CALENDAR_ListTile_yfvm2peo_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ListTile_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'Event',
                                                                        queryParameters:
                                                                            {
                                                                          'event':
                                                                              serializeParam(
                                                                            dataItem,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'event':
                                                                              dataItem,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        dataItem
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge,
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        dataItem
                                                                            .location,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                      ),
                                                                      trailing:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_forward_ios,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      dense:
                                                                          false,
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<EventsRecord>>(
                                                    stream: queryEventsRecord(
                                                      queryBuilder:
                                                          (eventsRecord) =>
                                                              eventsRecord
                                                                  .where(
                                                        'artists',
                                                        arrayContains:
                                                            FFAppState()
                                                                .filterArtist,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<EventsRecord>
                                                          containerEventsRecordList =
                                                          snapshot.data!;
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final data = containerEventsRecordList
                                                                  .where((e) =>
                                                                      dateTimeFormat(
                                                                        'MMM',
                                                                        e.date,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ) ==
                                                                      dateTimeFormat(
                                                                        'MMM',
                                                                        getCurrentTimestamp,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ))
                                                                  .toList();
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    data.length,
                                                                itemBuilder:
                                                                    (context,
                                                                        dataIndex) {
                                                                  final dataItem =
                                                                      data[
                                                                          dataIndex];
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_CALENDAR_ListTile_lzokq3nq_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ListTile_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'Event',
                                                                        queryParameters:
                                                                            {
                                                                          'event':
                                                                              serializeParam(
                                                                            dataItem,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'event':
                                                                              dataItem,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        dataItem
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge,
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        dataItem
                                                                            .location,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                      ),
                                                                      trailing:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_forward_ios,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      dense:
                                                                          false,
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        } else {
                                          return Builder(
                                            builder: (context) {
                                              if (FFAppState().filterArtist ==
                                                  null) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<EventsRecord>>(
                                                    stream: queryEventsRecord(
                                                      queryBuilder:
                                                          (eventsRecord) =>
                                                              eventsRecord
                                                                  .where(
                                                        'artists',
                                                        arrayContains:
                                                            currentUserReference,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<EventsRecord>
                                                          containerEventsRecordList =
                                                          snapshot.data!;
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final dateSelected1 =
                                                                  containerEventsRecordList
                                                                      .where((e) =>
                                                                          dateTimeFormat(
                                                                            'yMd',
                                                                            e.date,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ) ==
                                                                          dateTimeFormat(
                                                                            'yMd',
                                                                            _model.selectedDate,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))
                                                                      .toList();
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    dateSelected1
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        dateSelected1Index) {
                                                                  final dateSelected1Item =
                                                                      dateSelected1[
                                                                          dateSelected1Index];
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_CALENDAR_ListTile_uswqgp0l_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ListTile_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'Event',
                                                                        queryParameters:
                                                                            {
                                                                          'event':
                                                                              serializeParam(
                                                                            dateSelected1Item,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'event':
                                                                              dateSelected1Item,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        dateSelected1Item
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge,
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        dateSelected1Item
                                                                            .location,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                      ),
                                                                      trailing:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_forward_ios,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      dense:
                                                                          false,
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<EventsRecord>>(
                                                    stream: queryEventsRecord(
                                                      queryBuilder:
                                                          (eventsRecord) =>
                                                              eventsRecord
                                                                  .where(
                                                        'artists',
                                                        arrayContains:
                                                            FFAppState()
                                                                .filterArtist,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<EventsRecord>
                                                          containerEventsRecordList =
                                                          snapshot.data!;
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final dateSelected2 =
                                                                  containerEventsRecordList
                                                                      .where((e) =>
                                                                          dateTimeFormat(
                                                                            'yMd',
                                                                            e.date,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ) ==
                                                                          dateTimeFormat(
                                                                            'yMd',
                                                                            _model.selectedDate,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ))
                                                                      .toList();
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    dateSelected2
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        dateSelected2Index) {
                                                                  final dateSelected2Item =
                                                                      dateSelected2[
                                                                          dateSelected2Index];
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_CALENDAR_ListTile_nbitqqyq_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'ListTile_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'Event',
                                                                        queryParameters:
                                                                            {
                                                                          'event':
                                                                              serializeParam(
                                                                            dateSelected2Item,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'event':
                                                                              dateSelected2Item,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        ListTile(
                                                                      title:
                                                                          Text(
                                                                        dateSelected2Item
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge,
                                                                      ),
                                                                      subtitle:
                                                                          Text(
                                                                        dateSelected2Item
                                                                            .location,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                      ),
                                                                      trailing:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_forward_ios,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      tileColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      dense:
                                                                          false,
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.dropDownValue ??= dateTimeFormat(
                                      'MMM',
                                      getCurrentTimestamp,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                  ),
                                  options: FFAppConstants.months,
                                  onChanged: (val) async {
                                    setState(() => _model.dropDownValue = val);
                                    logFirebaseEvent(
                                        'HOME_CALENDAR_DropDown_58wgoqm3_ON_FORM_');
                                    logFirebaseEvent(
                                        'DropDown_update_page_state');
                                    setState(() {
                                      _model.selectedMonth =
                                          _model.dropDownValue!;
                                    });
                                  },
                                  width: 300.0,
                                  height: 56.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: FFLocalizations.of(context).getText(
                                    'uitmtbol' /* Please select month */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  borderWidth: 1.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '2apzmh7d' /* Coming Up */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      icon: Icon(
                                        Icons.filter_list,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'HOME_CALENDAR_filter_list_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: ArtistFilterWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    if (FFAppState().filterArtist == null) {
                                      return StreamBuilder<List<EventsRecord>>(
                                        stream: queryEventsRecord(
                                          queryBuilder: (eventsRecord) =>
                                              eventsRecord
                                                  .where(
                                                    'date',
                                                    isGreaterThan:
                                                        getCurrentTimestamp,
                                                  )
                                                  .where(
                                                    'artists',
                                                    arrayContains:
                                                        currentUserReference,
                                                  ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<EventsRecord>
                                              containerEventsRecordList =
                                              snapshot.data!;
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final upcoming =
                                                      containerEventsRecordList
                                                          .where((e) =>
                                                              dateTimeFormat(
                                                                'MMM',
                                                                e.date,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ) ==
                                                              _model
                                                                  .selectedMonth)
                                                          .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: upcoming.length,
                                                    itemBuilder: (context,
                                                        upcomingIndex) {
                                                      final upcomingItem =
                                                          upcoming[
                                                              upcomingIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    12.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 3.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 1.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        upcomingItem
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Card(
                                                                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                              color: FlutterFlowTheme.of(context).accent3,
                                                                              elevation: 0.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                child: Text(
                                                                                  dateTimeFormat(
                                                                                    'd/M h:mm a',
                                                                                    upcomingItem.date!,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            upcomingItem.location,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodySmall,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'HOME_CALENDAR_Container_l5spdyhz_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Container_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'Event',
                                                                      queryParameters:
                                                                          {
                                                                        'event':
                                                                            serializeParam(
                                                                          containerEventsRecordList[
                                                                              0],
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'event':
                                                                            containerEventsRecordList[0],
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .edit,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return StreamBuilder<List<EventsRecord>>(
                                        stream: queryEventsRecord(
                                          queryBuilder: (eventsRecord) =>
                                              eventsRecord
                                                  .where(
                                                    'date',
                                                    isGreaterThan:
                                                        getCurrentTimestamp,
                                                  )
                                                  .where(
                                                    'artists',
                                                    arrayContains: FFAppState()
                                                        .filterArtist,
                                                  ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<EventsRecord>
                                              containerEventsRecordList =
                                              snapshot.data!;
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final upcoming =
                                                      containerEventsRecordList
                                                          .where((e) =>
                                                              dateTimeFormat(
                                                                'MMM',
                                                                e.date,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ) ==
                                                              _model
                                                                  .selectedMonth)
                                                          .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: upcoming.length,
                                                    itemBuilder: (context,
                                                        upcomingIndex) {
                                                      final upcomingItem =
                                                          upcoming[
                                                              upcomingIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    12.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 3.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 1.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        upcomingItem
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Card(
                                                                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                              color: FlutterFlowTheme.of(context).accent3,
                                                                              elevation: 0.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                child: Text(
                                                                                  dateTimeFormat(
                                                                                    'd/M h:mm a',
                                                                                    upcomingItem.date!,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            upcomingItem.location,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodySmall,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'HOME_CALENDAR_Container_1sy71vjw_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Container_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'Event',
                                                                      queryParameters:
                                                                          {
                                                                        'event':
                                                                            serializeParam(
                                                                          containerEventsRecordList[
                                                                              0],
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'event':
                                                                            containerEventsRecordList[0],
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .edit,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
