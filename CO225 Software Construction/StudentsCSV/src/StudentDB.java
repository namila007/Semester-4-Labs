import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Created by Namila on 9/20/2017.
 */
public class StudentDB implements InterfaceStudents {
    private ArrayList<Students> studentList;
    private final int FNAME=0,LNAME=1,CONTACT=2; //csv file field values


    @SuppressWarnings("unchecked")
    public StudentDB(String csv){
        FileReader fileReader;
        BufferedReader bufferedReader;

        try {
             fileReader = new FileReader(csv);
             bufferedReader=new BufferedReader(fileReader);

             studentList=new <Students>ArrayList();
             String listValues[];
              for(String line=bufferedReader.readLine();line!=null;line=bufferedReader.readLine()){
                  listValues=line.split(",");
                  studentList.add(new Students(listValues[FNAME],listValues[LNAME],Integer.parseInt(listValues[CONTACT])));
              }


            }
         catch (ArrayIndexOutOfBoundsException e)  {
             System.out.println("Malformed CSV file");
             System.out.println(e);
         }
        catch(IOException e){
            System.out.println(e);
            System.exit(-1);
        }

    }
    @SuppressWarnings("unchecked")
    public ArrayList getFnameValues(String fname) {
        ArrayList values=new ArrayList();

        for(int i=0;i<studentList.size();i++){
            if(studentList.get(i).getfName().contains(fname)){
                values.add(studentList.get(i));
            }
        }
        return values;


    }
    @SuppressWarnings("unchecked")
    public ArrayList getLnameValues(String lname) {
        ArrayList values=new ArrayList();

        for(int i=0;i<studentList.size();i++){
            if(studentList.get(i).getlName().contains(lname)){
                values.add(studentList.get(i));
            }
        }
        return values;


    }

    @Override
    public int contactSize() {
        return studentList.size();
    }
}
