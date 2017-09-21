/**
 * Created by Namila on 9/8/2017.
 */
public class BankAccount {
    public int balance;


    public void deposit(int i) {
        this.balance+=i;
    }

    public int getBalance() {
        return balance;
    }


    public void withdraw(int i) {
        this.balance-=i;
    }
}

