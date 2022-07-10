//Create class God with two methods
public class God {

    public Human.Man createMan(String name){
        return new Human.Man(name);
    }

    public Human.Woman createWoman(String name){
        return new Human.Woman(name);
    }

}

//Create instance of God
God god = new God();

//Create instances of Man and Woman
Human.Man firstMan = god.createMan('Adam');
Human.Woman firstWoman = god.createWoman('Eve');