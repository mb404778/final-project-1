import 'package:flutter/material.dart';

class QuizHome extends StatefulWidget {
  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, List<Map<String, Object>>> quizData = {
    "Flutter": [
      {
        "question": "What is Flutter?",
        "options": ["SDK", "IDE", "Language", "Library"],
        "answer": "SDK"
      },
      {
        "question": "Who developed Flutter?",
        "options": ["Google", "Facebook", "Microsoft", "Apple"],
        "answer": "Google"
      },
      {
        "question": "Flutter uses which language?",
        "options": ["Kotlin", "Dart", "Java", "Swift"],
        "answer": "Dart"
      },
      {
        "question": "Flutter is?",
        "options": ["Open Source", "Paid", "Private"],
        "answer": "Open Source"
      },
      {
        "question": "What does hot reload do?",
        "options": ["Recompile", "Reload changes", "Restart app"],
        "answer": "Reload changes"
      },
    ],
    "Web": [
      {
        "question": "What does HTML stand for?",
        "options": ["HyperText Markup Language", "Tool", "Logic"],
        "answer": "HyperText Markup Language"
      },
      {
        "question": "What is CSS used for?",
        "options": ["Styling", "Logic", "Backend"],
        "answer": "Styling"
      },
      {
        "question": "JavaScript is?",
        "options": ["Scripting", "Markup", "Styling"],
        "answer": "Scripting"
      },
      {
        "question": "Framework for Web?",
        "options": ["React", "Flutter", "Both"],
        "answer": "Both"
      },
      {
        "question": "HTTP stands for?",
        "options": ["Hyper Transfer", "Hyper Text", "Markup"],
        "answer": "Hyper Text"
      },
    ],
    "Cyber": [
      {
        "question": "What is Phishing?",
        "options": ["Hacking", "Scam", "Malware"],
        "answer": "Scam"
      },
      {
        "question": "What is a VPN?",
        "options": ["Virtual Private Network", "Virus Protection Network"],
        "answer": "Virtual Private Network"
      },
      {
        "question": "What does a Firewall do?",
        "options": ["Block Traffic", "Store Data"],
        "answer": "Block Traffic"
      },
      {
        "question": "What is Malware?",
        "options": ["Malicious Software", "Network"],
        "answer": "Malicious Software"
      },
      {
        "question": "SSL stands for?",
        "options": ["Secure Socket Layer", "Super Security"],
        "answer": "Secure Socket Layer"
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: quizData.keys.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.blueAccent;
    final Color backgroundColor = Colors.blue[50]!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        bottom: TabBar(
          controller: _tabController,
          tabs: quizData.keys.map((key) {
            return Tab(
              child: Text(
                key,
                style: TextStyle(
                  fontSize: key == "Cyber Security" ? 22 : 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          }).toList(),
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: TabBarView(
          controller: _tabController,
          children: quizData.values
              .map((questions) =>
                  QuizPage(questions: questions, primaryColor: primaryColor))
              .toList(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final List<Map<String, Object>> questions;
  final Color primaryColor;

  QuizPage({required this.questions, required this.primaryColor});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  String _selectedOption = "";
  int _score = 0;

  void _nextQuestion() {
    setState(() {
      if (_selectedOption ==
          widget.questions[_currentQuestionIndex]["answer"]) {
        _score++;
      }
      _selectedOption = "";
      _currentQuestionIndex++;
    });
  }

  void _skipQuestion() {
    setState(() {
      _selectedOption = "";
      _currentQuestionIndex++;
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
        _selectedOption = "";
      }
    });
  }

  void _showResult() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          title: Text("Quiz Completed"),
          content: Text("Your Score: $_score / ${widget.questions.length}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                setState(() {
                  _currentQuestionIndex = 0;
                  _score = 0;
                });
              },
              child: Text("Restart"),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestionIndex >= widget.questions.length) {
      _showResult();
      return SizedBox();
    }

    final currentQuestion = widget.questions[_currentQuestionIndex];
    final options = currentQuestion["options"] as List<String>;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${_currentQuestionIndex + 1}. ${currentQuestion['question']}",
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(options.length, (index) {
              return GestureDetector(
                onTap: _selectedOption.isEmpty
                    ? () => setState(() => _selectedOption = options[index])
                    : null, // إذا تم اختيار إجابة، لا يمكن التغيير
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: _selectedOption == options[index]
                        ? widget.primaryColor.withOpacity(0.5)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        "${['A', 'B', 'C', 'D'][index]}. ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          options[index],
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (_currentQuestionIndex > 0)
                ElevatedButton(
                  onPressed: _previousQuestion,
                  child: Text(
                    "Previous",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ElevatedButton(
                onPressed: _skipQuestion,
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              ElevatedButton(
                onPressed: _selectedOption.isNotEmpty ? _nextQuestion : null,
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
