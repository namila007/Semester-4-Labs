import java.io.IOException;

/**
 * Created by Namila on 9/13/2017.
 */
public class RAM implements MemInterface{

    private  int[] object;
    public RAM(int size){
        object=new int[size];

    }


    @Override
    public int lw(String address) throws IOException {
        try{
            return object[Integer.parseInt(address)];
        }catch (NumberFormatException e){
            throw new IOException("Address format invalid");
        }

    }

    @Override
    public void sw(String address, int val) throws IOException {
        try{
           this.object[Integer.parseInt(address)]=val;
        }catch (NumberFormatException e){

        }
    }

    @Override
    public int cacheHits() {
        return 0;
    }

    @Override
    public int cacheMisses() {
        return 0;
    }
}
