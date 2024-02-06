class Node {
  String data = "";
  Node? next;

  Node(String data) {
    this.data = data;
    this.next = null;
  }
}

class Stack {
  Node? top;
  int size = 0;

  Stack() {
    this.top = null;
    this.size = 0;
  }

  bool isEmpty() {
    return top == null;
  }

  void push(String data) {
    Node newNode = Node(data);
    newNode.next = top;
    top = newNode;
    size++;
  }

  String? pop() {
    if (isEmpty()) {
      print("Stack is empty");
      return null;
    }

    String? res = top?.data;
    top = top?.next;
    size--;

    return res;
  }

  String? peek() {
    return isEmpty() ? null : top?.data;
  }

  int getSize() {
    return size;
  }
}

class ExpressionConverter {
  Stack st = Stack();

  String postfixToPrefix(String postfix) {
    int length = postfix.length;

    for (int i = 0; i < length; i++) {
      String ch = postfix[i];
      if (RegExp(r'[a-zA-Z0-9]').hasMatch(ch)) {
        st.push(ch);
      } else {
        String? op1 = st.pop();
        String? op2 = st.pop();

        String res = ch + op2! + op1!;
        st.push(res);
      }
    }

    return st.pop() ?? "";
  }

  String prefixToPostfix(String prefix) {
    int length = prefix.length;

    for (int i = length - 1; i >= 0; i--) {
      String ch = prefix[i];
      if (RegExp(r'[a-zA-Z0-9]').hasMatch(ch)) {
        st.push(ch);
      } else {
        String? op1 = st.pop();
        String? op2 = st.pop();

        String res = op1! + op2! + ch;
        st.push(res);
      }
    }

    return st.pop() ?? "";
  }
}
