import org.testng.Assert;
import org.testng.annotations.Test;

/**
 * Created by Namila on 9/8/2017.
 */
public class BankAccountTest {

    @Test
    public void testdeposit(){
        BankAccount account= new BankAccount();
        account.deposit(50);
        Assert.assertEquals(account.getBalance(),50);
    }
 @Test
    public void testWithdraw( ){
        BankAccount account=new BankAccount();
        account.deposit(50);
        account.withdraw(50);
        Assert.assertEquals(account.getBalance(),0);
    }

}
