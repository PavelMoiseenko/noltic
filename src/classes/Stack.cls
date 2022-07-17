public class Stack {
    List<Integer> stack;

    public void push(Integer value) {

        if (stack == null) {
            stack = new List<Integer>{value};
        } else {
            stack.add(value);
        }

        System.debug(stack);
    }

    public Integer pop() {
        if (stack == null || stack.isEmpty()) {
            System.debug('Stack is empty');
            return null;
        } else {
            Integer lastElement = stack.remove(stack.size() - 1);
            return lastElement;
        }

    }
}

//Code to test class Stack
//
//Stack myStack = new Stack();
//myStack.push(1);
//myStack.push(2);
//myStack.push(3);
//System.debug(myStack.pop());
//System.debug(myStack.pop());