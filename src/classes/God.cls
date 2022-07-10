//Create class God with two methods
public class God {

    public Man createMan(String name) {
        return new Man(name);
    }

    public Woman createWoman(String name) {
        return new Woman(name);
    }

}

//Creates instance of God
God god = new God();

//Creates instances of Man and Woman with names Adam and Eve
Man firstMan = god.createMan('Adam');
Woman firstWoman = god.createWoman('Eve');