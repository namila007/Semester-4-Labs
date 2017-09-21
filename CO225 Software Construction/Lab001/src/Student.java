/**
 * Created by Namila on 7/10/2017.
 */
public class Student {
    private String surname;
    private final static float MAX_ATTEND=45;
    private int attendence;
    private float percentage;




    public Student(String surname, int attendence){
        //initializing the student object
        this.surname=surname;
        this.attendence=attendence;
        this.percentage=0;

    }


    public float showPercentage(){
        return  this.percentage;
    }

    public static float getAverage(Student[] students){
        //calculating average attendance
        float total = 0;
        for (Student student: students) {
            total += student.percentage;
        }
        return (total/students.length)*100;

    }

    public void showName(){
        //printing the name
        System.out.println(this.surname);
    }

    public void lowAttend(){
        //calculating attendance percentage
        this.percentage=(this.attendence)/(MAX_ATTEND);

    }









}
