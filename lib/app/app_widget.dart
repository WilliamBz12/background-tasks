import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'logic/add_checklist_item/add_checklist_cubit.dart';
import 'logic/checklist/checklist_cubit.dart';
import 'logic/delete_checklist_item/delete_checklist_cubit.dart';
import 'logic/update_checklist_item/update_checklist_cubit.dart';
import 'pages/checklist_page.dart';
import 'repositories/checklist_repository.dart';
import 'services/couchbase_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MultiProvider(
      providers: [
        Provider(create: (context) => CouchbaseService()),

        // Fornece o ChecklistRepository
        Provider(
          create: (context) => ChecklistRepository(
            couchbaseService: context.read<CouchbaseService>(),
          ),
        ),
        // Fornece os Cubits, que usam o mesmo repositório
        BlocProvider(
          create: (context) => FetchChecklistCubit(
            context.read<ChecklistRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => AddChecklistCubit(
            context.read<ChecklistRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => UpdateChecklistCubit(
            context.read<ChecklistRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => DeleteChecklistCubit(
            context.read<ChecklistRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Checklist',
        locale: const Locale('pt', 'BR'),
        theme: ThemeData(
          fontFamily: 'numans',
          textTheme: GoogleFonts.numansTextTheme(textTheme),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xffF55B64),
            primary: const Color(0xffF55B64),
          ),
          useMaterial3: true,
        ),
        home: ChecklistPage(),
      ),
    );
  }
}
