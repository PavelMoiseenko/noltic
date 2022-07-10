//Create outer class Human and two inner classes Man and Woman

public virtual class Human {
    public String name;

    public Human(String name){
        this.name = name;
    }

    public class Man extends Human{
        public Man(String name){
            super(name);
        }
    }

    public class Woman extends Human{

        public Woman(String name){
            super(name);
        }

    }
}