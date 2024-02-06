import 'package:flutter/material.dart';
import '../expression-convertor/expression_convertor/lib/infix_to_postfix_convertor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const ConversionApp(),
    );
  }
}

class ConversionApp extends StatefulWidget {
  const ConversionApp({super.key});

  @override
  _ConversionAppState createState() => _ConversionAppState();
}

class _ConversionAppState extends State<ConversionApp> {
  final _expressionController = TextEditingController(text: "ab+c-def^^*g/");
  String _result = '';
  String _selectedConversion = 'Postfix to Prefix';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expression Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              focusColor: Colors.blue,
              value: _selectedConversion,
              items: <String>['Postfix to Prefix', 'Prefix to Postfix']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedConversion = newValue!;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: _expressionController,
              decoration: const InputDecoration(labelText: 'Enter expression'),
            ),
            const SizedBox(height: 46),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                final expression = _expressionController.text;
                // String result;
                setState(() {
                  if (_selectedConversion == 'Postfix to Prefix') {
                    _result = ExpressionConverter().postfixToPrefix(expression);
                  } else {
                    _result = ExpressionConverter().prefixToPostfix(expression);
                  }
                });
              },
              child: Text(
                'Convert $_selectedConversion',
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Result:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red)),
            const SizedBox(
              height: 20,
            ),
            Text(_result,
                style: const TextStyle(fontSize: 20, color: Colors.green)),
          ],
        ),
      ),
    );
  }

  void _convertExpression() {}
}
