public class Battle {
    public Fighter fighter1;
    public Fighter fighter2;
    public Fighter winner;

    public Battle(Fighter fighter1, Fighter fighter2) {
        this.fighter1 = fighter1;
        this.fighter2 = fighter2;
    }

    public String getWinnerName() {

        while (this.fighter1.isLive() && this.fighter2.isLive()) {
            this.fighter1.makeDamage(this.fighter2);

            if (this.fighter2.isLive()) {
                this.fighter2.makeDamage(this.fighter1);

                if (!this.fighter1.isLive()) {
                    this.winner = this.fighter2;
                }

            } else {
                this.winner = this.fighter1;
            }

        }

        return this.winner.name;
    }

}