import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, String>> _messages = []; // Stores all messages
  final List<String> _user1Replies = [
    "Hi there!",
    "What is your name?",
    "What is your gender?",
    "What is your Date of Birth?",
    "What is your Time of Birth?",
    "What is your marital status?",
    "You will get success soon😊😊",
    "How may i help you?",
    "Have a great day!"
  ]; // Predefined replies for user 1
  int _currentReplyIndex = 0; // Tracks the current reply index
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String text) {
    if (text.isEmpty) return;

    // Add the second user's message
    setState(() {
      _messages.add({"sender": "User 2", "message": text});
    });

    _controller.clear();

    // Trigger a single reply from User 1
    _triggerReply();
  }

  void _triggerReply() {
    if (_currentReplyIndex < _user1Replies.length) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _messages.add({
            "sender": "User 1",
            "message": _user1Replies[_currentReplyIndex]
          });
          _currentReplyIndex++;
        });
      });
    }
  }
@override
  void initState() {
  _triggerReply();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Page"),
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.blue.withOpacity(0.2),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final isUser2 = message['sender'] == "User 2";
                  return Align(
                    alignment: isUser2 ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: isUser2 ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message['message']!,
                        style: TextStyle(color: isUser2 ? Colors.white : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _sendMessage(_controller.text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
