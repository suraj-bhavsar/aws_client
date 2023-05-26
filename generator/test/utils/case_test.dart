import 'package:aws_client_generator/utils/case.dart';
import 'package:test/test.dart';

void main() {
  test('split word', () {
    for (var entry in const {
      '': [],
      '   ': [],
      'a': ['a'],
      'aaa': ['aaa'],
      '   aaa   ': ['aaa'],
      ' -  aaa -  ': ['aaa'],
      r' -  ,aaa,./*$%€^¨@ -  ': ['aaa'],
      r' -  ,aaa,./*$%€^¨@b -  ': ['aaa', 'b'],
      'some words': ['some', 'words'],
      'some    words': ['some', 'words'],
      '    some    words   ': ['some', 'words'],
      'some_words': ['some', 'words'],
      'some__words': ['some', 'words'],
      '_some__words_': ['some', 'words'],
      'some-words': ['some', 'words'],
      '---some-words---': ['some', 'words'],
      '-_some words_-': ['some', 'words'],
      '__some--words__': ['some', 'words'],
      'someWords': ['some', 'Words'],
      'SomeWords': ['Some', 'Words'],
      "Some'Words": ['Some', 'Words'],
      'Some"Words': ['Some', 'Words'],
      'Some "Words': ['Some', 'Words'],
      'HTMLParser': ['HTML', 'Parser'],
      'XMLHttpRequest': ['XML', 'Http', 'Request'],
      '1234Parser': ['1234', 'Parser'],
      '1234parser': ['1234', 'parser'],
      'Parser1234': ['Parser', '1234'],
      'HP2G': ['HP', '2G'],
      'H2O': ['H2O'],
      'HO2': ['HO2'],
      'HO24': ['HO', '24'],
      'HyO2': ['Hy', 'O2'],
      'HyO24': ['Hy', 'O24'],
      'HyOd24': ['Hy', 'Od', '24'],
      'HyOd2': ['Hy', 'Od2'],
      'HyOD24': ['Hy', 'OD', '24'],
      'HyOD2': ['Hy', 'OD2'],
      'DoItOrNot4X': ['Do', 'It', 'Or', 'Not', '4X'],
      'DoItOrNot4': ['Do', 'It', 'Or', 'Not4'],
      'wheel_OfFortune': ['wheel', 'Of', 'Fortune'],
      'AString': ['A', 'String'],
      'HelloWorld': ['Hello', 'World'],
      'HélloWôrld': ['Héllo', 'Wôrld'],
      r'Héllo$Wôrld': ['Héllo', 'Wôrld'],
      'Héllo%Wôrld': ['Héllo', 'Wôrld'],
      'Héllo%WÔrld': ['Héllo', 'W', 'Ôrld'],
      'snake_case_2': ['snake', 'case', '2'],
      'kebab-case-2': ['kebab', 'case', '2'],
      'some.string': ['some', 'string'],
      'sômè.string': ['sômè', 'string'],
      'AmazonS3': ['Amazon', 'S3'],
      'Amazons3': ['Amazons3'],
      'AmazonIoT': ['Amazon', 'IoT'],
      'ServiceV2': ['Service', 'V2'],
      'AAmaZ': ['A', 'AmaZ'],
      'AAmZ': ['A', 'AmZ'],
      'IoT1Click': ['Io', 'T1', 'Click'],
      'IoT1-Click': ['Io', 'T1', 'Click'],
      'IoT 1-Click': ['IoT', '1', 'Click'],
      'IoTAmz': ['IoT', 'Amz'],
      'IoTA': ['Io', 'TA'],
      'IoT': ['IoT'],
      'IoTAIoTA': ['Io', 'TA', 'Io', 'TA'],
      'SESv2': ['SE', 'Sv2'],
    }.entries) {
      expect(splitWords(entry.key), equals(entry.value),
          reason: 'input: ${entry.key}');
    }
  });
}
