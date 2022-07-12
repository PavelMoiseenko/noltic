public class Fighter {
    public String name;
    public Integer health;
    public Integer damagePerAttack;

    public Fighter(String name, Integer health, Integer damagePerAttack) {
        this.name = name;
        this.health = health;
        this.damagePerAttack = damagePerAttack;
    }

    public Boolean isLive() {
        return this.health > 0 ? true : false;
    }

    public void makeDamage(Fighter victim) {
        victim.health -= this.damagePerAttack;
    }
}

//This is code to check programm in Anonymous Apex tab

//Fighter fighter1 = new Fighter('Mars', 30, 10);
//Fighter fighter2 = new Fighter('Caesar', 40, 10);
//
//Battle battle = new Battle(fighter1, fighter2);
//System.debug('Winner is ' + battle.getWinnerName());