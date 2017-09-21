import java.io.FileReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

/**
 * Created by Namila on 9/21/2017.
 */
public class Main {
     private static InterfaceStudents studentDB; //initializing interface



    public static void main(String[] args) {
        ArrayList values;
        Students studentvalues;
        studentDB = new StudentDB("contactlist.csv");


        while (true) {
            System.out.println("=================|WELCOME|====================");
            System.out.println("Contacts Added to Database : " + studentDB.contactSize());
            System.out.println("Enter F:<Firstname> or L:<Lastname> to search");
            System.out.println("Enter exit to exit the program");
            System.out.println("----------------------------------------------");
            System.out.print("Enter the Query: ");

            Scanner scanner = new Scanner(System.in); //getting scan
            String[] argVal = scanner.next().split(":"); //spliting the string in to parts
            if (argVal[0].equals("exit")) System.exit(0);

            if (argVal[0].contains("F") || argVal[0].contains("f")) {
                values = studentDB.getFnameValues(argVal[1].replace(" ", ""));
                System.out.println();
                System.out.println("Matches found for " + argVal[1].toUpperCase() + "  : " + values.size());
                System.out.println("-----------------------------------------------");
                for (int i = 0; i < values.size(); i++) {
                    studentvalues = (Students) values.get(i);
                    System.out.printf("%-10s %-10s : %-10d\n", studentvalues.getfName().toUpperCase(), studentvalues.getlName().toUpperCase(), studentvalues.getContact());

                }
                System.out.println("==============================================");
            } else if (argVal[0].contains("L") || argVal[0].contains("l")) {
                values = studentDB.getLnameValues(argVal[1].replace(" ", ""));
                System.out.println();
                System.out.println("Matches found for " + argVal[1].toUpperCase() + "  : " + values.size());
                System.out.println("-----------------------------------------------");
                for (int i = 0; i < values.size(); i++) {
                    studentvalues = (Students) values.get(i);
                    System.out.printf("%-10s %-10s : %-10d\n", studentvalues.getfName().toUpperCase(), studentvalues.getlName().toUpperCase(), studentvalues.getContact());
                }
                System.out.println("==============================================");
            } else {
                System.out.println("Wrong Input");
                System.exit(-1);
            }

        }


    }

}
