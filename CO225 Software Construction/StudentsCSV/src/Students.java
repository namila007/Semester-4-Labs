/**
 * Created by Namila on 9/21/2017.
 */
public class Students {
    private String fName,lName;
    private int contact;

    public Students(String fName,String lName,int contact){
        this.fName=fName;
        this.lName=lName;
        this.contact=contact;
    }

    public String getfName() {
        return fName;
    }

    public String getlName() {
        return lName;
    }

    public int getContact() {
        return contact;
    }
}
