
import 'package:chat_gpt/core/app_theme.dart';
import 'package:chat_gpt/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chat_gpt/features/welcome_screen/presentation/bloc/welcome_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'features/spalsh_screen/presentation/pages/spalsh_screen.dart';
import 'injection_container.dart' as di;

import 'features/chat/presentation/pages/chat_page.dart';
void main() async {
  await dotenv.load();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<WelcomeBloc>()..add(const WelcomeNext(index: 0))),
        BlocProvider(create: (_) => di.sl<ChatBloc>()),
      ],
      child: MaterialApp(
        title: 'chat gpt',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const SplashScreen(),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   String responseTxt = "" ;
//   TextEditingController promptController = TextEditingController();
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       backgroundColor: const Color(0xff343541),
//       appBar: AppBar(
//         title: const Text(
//           'Flutter and ChatGPT',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: const Color(0xff343541),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(responseTxt),
//           Row(
//             children: [
//               Container(
//                 height: 100,
//                 width: 100,
//                 child: TextFormField(
//                     controller: promptController,),
//               ),
//               ElevatedButton(onPressed: ()async{
//
//                   setState(() => responseTxt = 'Loading...');
//
//                   final response = await http.post(
//                     Uri.parse('https://api.openai.com/v1/completions'),
//                     headers: {
//                       'Content-Type': 'application/json',
//                       'Authorization': 'Bearer ${dotenv.env['token']}'
//                     },
//                     body: jsonEncode(
//                       {
//                         "model": "text-davinci-002",
//                         "prompt": promptController.text,
//                         "max_tokens": 250,
//                         "temperature": 0,
//                         "top_p": 1,
//                       },
//                     ),
//                   );
//
//                   setState(() {
//                     responseTxt = response.body.toString();
//                     debugPrint(responseTxt);
//                   });
//
//               }, child: Text("button"))
//             ],
//           ),
//         ],
//       ),
//     );;
//   }
// }
