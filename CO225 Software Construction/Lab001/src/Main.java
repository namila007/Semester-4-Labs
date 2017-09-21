import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;


/**
 * Created by Namila on 7/10/2017.
 */
public class Main {


    public static void main(String[] args) {

       final int MAX_ATTENDS=46;
       int random;


        try{
            //making file reader to access file
            FileReader fr=new FileReader("co225-classlist.txt");

           BufferedReader br=new BufferedReader(fr);

           //creating student array object
           Student [] students = new Student[61];
           //storing all surnames and random attendence value in each student objects
           for(int i=0;i<61;i++) {
                random=(int)(Math.random()*MAX_ATTENDS);

                students[i]=new Student(br.readLine(),random);
                students[i].lowAttend();
            }


            for(int i=0;i<61;i++){
               //calculating average attendance
               if(students[i].showPercentage()<0.8){
                  students[i].showName();
               }
            }

            System.out.printf("Class Average: %.2f%s\n",Student.getAverage(students),"%");


       }
       catch (IOException e){
           System.out.println("Error Cant read"+e);

       }

    }





}
