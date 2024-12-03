class DummyDB {
  static List<Map<String, dynamic>> getQuestions(String topic) {
    final Map<String, List<Map<String, dynamic>>> db = {
      "java": [
        {"question": "What is the size of int in Java?",
         "options": ["2 bytes", "4 bytes", "8 bytes", "Depends on JVM"],
          "answer": "4 bytes"},
        {"question": "Which keyword is used to inherit a class in Java?",
         "options": ["implements", "extends", "inherits", "super"],
          "answer": "extends"},
        {"question": "What is the entry point for a Java program?", 
        "options": ["main()", "start()", "init()", "run()"], 
        "answer": "main()"},
        {"question": "Which data type is used for true/false values?",
         "options": ["int", "boolean", "char", "double"],
          "answer": "boolean"},
        {"question": "Which operator is used for concatenating strings?",
         "options": ["+", "&", ".", "*"], 
         "answer": "+"},
        {"question": "Which package contains the `String` class?",
         "options": ["java.io", "java.lang", "java.util", "java.text"], 
         "answer": "java.lang"},
        {"question": "What is the default value of a boolean variable?", 
        "options": ["true", "false", "0", "null"],
         "answer": "false"},
        {"question": "What is the extension for compiled Java files?",
         "options": [".java", ".class", ".jar", ".exe"],
          "answer": ".class"},
        {"question": "Which access modifier makes a member accessible in the same package?", 
        "options": ["private", "protected", "public", "default"],
         "answer": "default"},
        {"question": "What does JVM stand for?",
         "options": ["Java Virtual Machine", "Java Variable Machine", "Java Visual Machine", "Java Version Maker"],
          "answer": "Java Virtual Machine"}
      ],
      "c#": [
        {"question": "Which symbol is used to start a comment in C?",
         "options": ["//", "#", "/*", "--"],
          "answer": "//"},
        {"question": "What is the file extension for C programs?", 
        "options": [".c", ".cpp", ".cs", ".exe"], 
        "answer": ".c"},
        {"question": "What is the output of `printf(\"%d\", 5 + 3);`?", 
        "options": ["53", "8", "5+3", "Error"],
         "answer": "8"},
        {"question": "Which operator is used to access a pointer value?", 
        "options": ["&", "*", ".", "#"],
         "answer": "*"},
        {"question": "Which function is used to allocate memory dynamically?",
         "options": ["malloc()", "alloc()", "memalloc()", "allocate()"], 
         "answer": "malloc()"},
        {"question": "Which header file is used for input and output functions?",
         "options": ["stdio.h", "stdlib.h", "string.h", "ctype.h"], "answer": "stdio.h"},
        {"question": "What does `sizeof(int)` return?",
         "options": ["2", "4", "8", "Depends"], 
         "answer": "4"},
        {"question": "Which keyword is used to declare constants?", 
        "options": ["constant", "const", "define", "static"], 
        "answer": "const"},
        {"question": "What is the starting index of an array in C?", 
        "options": ["0", "1", "-1", "Depends"], 
        "answer": "0"},
        {"question": "What is used to terminate a C program?", 
        "options": ["exit()", "break", "stop()", "end()"], 
        "answer": "exit()"}
      ],
      "c++": [
        {"question": "Which is a valid C++ header file?", 
        "options": ["stdio.h", "iostream", "conio.h", "stdlib.h"], 
        "answer": "iostream"},
        {"question": "Which keyword is used to define a class?",
         "options": ["class", "define", "class_def", "new"],
          "answer": "class"},
        {"question": "Which operator is overloaded to support object copying?", 
        "options": ["=", "==", "->", "None"],
         "answer": "="},
        {"question": "What is the size of a pointer in C++?",
         "options": ["2 bytes", "4 bytes", "8 bytes", "Depends"], 
         "answer": "8 bytes"},
        {"question": "Which keyword is used for inheritance?",
         "options": ["extends", "inherits", "base", "None"], 
         "answer": "None"},
        {"question": "What is the extension of C++ files?", 
        "options": [".cpp", ".c", ".cs", ".java"], 
        "answer": ".cpp"},
        {"question": "Which access modifier allows access in subclasses?", 
        "options": ["private", "protected", "public", "package"], 
        "answer": "protected"},
        {"question": "What is `new` keyword used for?",
         "options": ["Memory Allocation", "Function Creation", "Pointer Creation", "None"], 
         "answer": "Memory Allocation"},
        {"question": "Which function is used for input in C++?", 
        "options": ["scanf()", "cout", "cin", "printf"], "answer": "cin"},
        {"question": "What is `delete` used for?", "options": ["Memory deallocation", "Input", "Object deletion", "Output"],
         "answer": "Memory deallocation"}
      ],
      "python": [
        {"question": "Which keyword is used to define a function in Python?",
         "options": ["func", "def", "define", "lambda"], 
         "answer": "def"},
        {"question": "Which data structure is mutable?", 
        "options": ["list", "tuple", "string", "int"],
         "answer": "list"},
        {"question": "What does `len()` return?",
         "options": ["Length of the string", "Total size", "Number of bytes", "None"], 
         "answer": "Length of the string"},
        {"question": "What is the output of `print(2 ** 3)`?",
         "options": ["6", "8", "9", "4"], 
         "answer": "8"},
        {"question": "Which library is used for data analysis?",
         "options": ["numpy", "pandas", "matplotlib", "all"], 
         "answer": "pandas"},
        {"question": "What is used to handle exceptions?", 
        "options": ["try-except", "catch", "except-finally", "handle"], 
        "answer": "try-except"},
        {"question": "What is the default value of an unassigned variable?",
         "options": ["null", "None", "0", "undefined"],
          "answer": "None"},
        {"question": "Which function converts a string to int?",
         "options": ["int()", "float()", "str()", "eval()"], 
         "answer": "int()"},
        {"question": "How do you create a list?", 
        "options": ["()", "[]", "{}", "<>"], 
        "answer": "[]"},
        {"question": "What is the keyword for inheritance?", 
        "options": ["extends", "inherits", "super", "None"], 
        "answer": "None"}
      ],
       "ruby": [
    {
      "question": "Which keyword is used to define a method in Ruby?",
      "options": ["function", "def", "method", "define"],
      "answer": "def"
    },
    {
      "question": "Which of the following is a way to create an array in Ruby?",
      "options": ["array()", "[]", "{}", "<>"],
      "answer": "[]"
    },
    {
      "question": "How do you denote a block of code in Ruby?",
      "options": ["{}", "[]", "do...end", "begin...end"],
      "answer": "do...end"
    },
    {
      "question": "What is the result of `5.times { print 'Hi' }`?",
      "options": ["Prints 'Hi' 5 times", "Throws an error", "Prints 'Hi'", "Prints 'Hi' 4 times"],
      "answer": "Prints 'Hi' 5 times"
    },
    {
      "question": "Which method is used to convert a string to an integer?",
      "options": ["to_int", "convert_to_int", "to_i", "str_to_int"],
      "answer": "to_i"
    },
    {
      "question": "Which symbol is used to denote instance variables in Ruby?",
      "options": ["/", "#", "@", "%"],
      "answer": "@"
    },
    {
      "question": "What does `nil` represent in Ruby?",
      "options": ["A number", "An empty array", "The absence of a value", "A type of string"],
      "answer": "The absence of a value"
    },
    {
      "question": "Which operator is used for string interpolation in Ruby?",
      "options": ["%", "#{...}", "@", "&"],
      "answer": "#{...}"
    },
    {
      "question": "What is the result of `[1, 2, 3].map { |x| x * 2 }`?",
      "options": ["[1, 2, 3, 2]", "[2, 4, 6]", "[1, 2, 3]", "[4, 6, 8]"],
      "answer": "[2, 4, 6]"
    },
    {
      "question": "Which method is used to get the length of a string in Ruby?",
      "options": ["size()", "length()", "count()", "len()"],
      "answer": "length()"
    }
  ],
    "javascript": [
    {
      "question": "Which keyword is used to declare a variable in JavaScript?",
      "options": ["var", "let", "const", "All of the above"],
      "answer": "All of the above"
    },
    {
      "question": "What does `typeof null` return in JavaScript?",
      "options": ["null", "object", "undefined", "string"],
      "answer": "object"
    },
    {
      "question": "Which method is used to parse a string into a JSON object?",
      "options": ["JSON.parse()", "JSON.stringify()", "JSON.decode()", "parseJSON()"],
      "answer": "JSON.parse()"
    },
    {
      "question": "What is the output of `console.log(typeof NaN)`?",
      "options": ["number", "NaN", "undefined", "object"],
      "answer": "number"
    },
    {
      "question": "Which operator is used to compare both value and type in JavaScript?",
      "options": ["==", "===", "=", "!="],
      "answer": "==="
    },
    {
      "question": "How do you create a function in JavaScript?",
      "options": [
        "function myFunction() {}",
        "def myFunction() {}",
        "function:myFunction() {}",
        "create myFunction() {}"
      ],
      "answer": "function myFunction() {}"
    },
    {
      "question": "Which statement is used to stop a loop prematurely?",
      "options": ["break", "stop", "exit", "return"],
      "answer": "break"
    },
    {
      "question": "What is the correct way to write an arrow function?",
      "options": [
        "() => { return value; }",
        "=> { return value; }",
        "() -> { return value; }",
        "function => { return value; }"
      ],
      "answer": "() => { return value; }"
    },
    {
      "question": "Which method adds an element to the end of an array?",
      "options": ["push()", "append()", "add()", "insert()"],
      "answer": "push()"
    },
    {
      "question": "What is the output of `console.log(1 + '2' + 3)`?",
      "options": ["123", "6", "33", "15"],
      "answer": "123"
    }
  ]

    
    };

    return db[topic] ?? [];
  }
}
