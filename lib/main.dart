import 'package:flutter/material.dart';

class RadioExample extends StatefulWidget {
  @override
  _RadioExampleState createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  int _selectedOption = -1;
  int _selectedSubOption = -1;

  List<String> _options = ['Option 1', 'Option 2'];
  List<List<String>> _subOptions = [
    ['Sub Option 1', 'Sub Option 2', 'Sub Option 3'],
    ['Sub Option 4', 'Sub Option 5', 'Sub Option 6'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select an option:',
              style: TextStyle(fontSize: 16),
            ),
            Column(
              children: _buildOptions(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOptions() {
    List<Widget> radioOptions = [];

    for (int i = 0; i < _options.length; i++) {
      radioOptions.add(
        RadioListTile(
          title: Text(_options[i]),
          value: i,
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value!;
              _selectedSubOption = -1;
            });
          },
        ),
      );

      if (_selectedOption == i) {
        List<String> subOptions = _subOptions[i];

        for (int j = 0; j < subOptions.length; j++) {
          radioOptions.add(
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: RadioListTile(
                title: Text(subOptions[j]),
                value: j,
                groupValue: _selectedSubOption,
                onChanged: (value) {
                  setState(() {
                    _selectedSubOption = value!;
                    print('SelectedOption $_selectedSubOption');
                  });
                },
              ),
            ),
          );
        }
      }
    }

    return radioOptions;
  }
}

void main() {
  runApp(MaterialApp(
    home: RadioExample(),
  ));
}
