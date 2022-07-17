public class Queue {
    List<Integer> queue;

    public void push(Integer value){
        if (queue == null) {
            queue = new List<Integer>{value};
        } else {
            queue.add(value);
        }

        System.debug(queue);
    }

    public Integer shift(){

        if (queue == null || queue.isEmpty()) {
            System.debug('Queue is empty');
            return null;
        } else {
            Integer firstElement = queue.remove(0);
            return firstElement;
        }
    }
}

//Code to test class Queue
//
//Queue q = new Queue();
//q.push(1);
//q.push(2);
//q.push(3);
//System.debug(q.shift());
//System.debug(q.shift());