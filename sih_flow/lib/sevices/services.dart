// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sih_flow/sevices/key.dart';

class OpenAIServices {
  Future<String> solutionAPI(String prompt) async {
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIkey',
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                'role': 'user',
                'content':
                    '$prompt this is the querry related to my plant and i want you to give me the solution using any pesticides or insecticides or using any fertilizers so give me at max 3 points so cure it and it should be consice enough to understand. And start with telling the exact name of the disease then start with the solution.'
              },
            ],
          },
        ),
      );
      print(res.body);
      if (res.statusCode == 200) {
        final jsonResponse = jsonDecode(res.body);

        // Extracting relevant content
        final choices = jsonResponse['choices'];
        if (choices != null && choices.isNotEmpty) {
          final assistantMessage = choices[0]['message']['content'];

          // Formatting content (replace '\n\n' with a new line)
          final formattedContent = assistantMessage.replaceAll(r'\n\n', '\n');

          return formattedContent;
        }
      }

      return 'Failed to fetch a valid response.';
    } catch (e) {
      return 'Error: $e';
    }
  }
  
  
  Future<String> organicsolutionAPI(String prompt) async {
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIkey',
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                'role': 'user',
                'content':
                    '$prompt this is the querry related to my plant and i want you to give me the organic solution which i can solve my problem using home remedies only, so give me at max 3 points so cure it and it should be concise enough to understand. And start with telling the exact name of the disease then start with the solution.'
              },
            ],
          },
        ),
      );
      print(res.body);
      if (res.statusCode == 200) {
        final jsonResponse = jsonDecode(res.body);

        // Extracting relevant content
        final choices = jsonResponse['choices'];
        if (choices != null && choices.isNotEmpty) {
          final assistantMessage = choices[0]['message']['content'];

          // Formatting content (replace '\n\n' with a new line)
          final formattedContent = assistantMessage.replaceAll(r'\n\n', '\n');

          return formattedContent;
        }
      }

      return 'Failed to fetch a valid response.';
    } catch (e) {
      return 'Error: $e';
    }
  }
}
