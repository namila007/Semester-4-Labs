
/* my array list: an array that behaves like a list 
 * E/14/084
 */

import java.util.Arrays;

public class MySet<T extends Comparable/* Can we have any T */>  {

    int nextItem; 
    int currentCapacity; 
    T[] data; // DO NOT CHANGE

    private static int defaultSizeToCreate = 10; // how many elements to create 

    public MySet(int elements) { 
	this.nextItem = 0; 
	this.defaultSizeToCreate = elements; 
	this.currentCapacity = elements; 

	this.data = (T[]) new Comparable[this.defaultSizeToCreate];
    }

    public MySet() { 
	this(defaultSizeToCreate); 
    }

    public boolean isEmpty() { return this.nextItem == 0; } 
    public boolean isFull() { return false; /* never get filled */} 

    public boolean add(T item) { 
	data[nextItem] = null; // DO NOT CHANGE 

	/* if there is any element delete it 
	 * then add the new element. 
	 * How do you handle when the array is full: 
	 * crate a new array with currentCapacity+defaultSizeToCreate, 
	 * copy the old conents into that
	 * Accessing array when full might be a problem
	 */



	if(Arrays.asList(data).contains(item))return false;
    else{
        if(nextItem+1==currentCapacity)
            createNewArray();

        this.data[nextItem++]=item;

        return true;
    }


	/* Add the item to the array if the item is not there */
	//return false; // CHANGE ME

    }


    public void createNewArray (){

       T[] newarray= Arrays.copyOf(data,this.data.length+defaultSizeToCreate);
        this.data= newarray;
        this.currentCapacity=newarray.length;

    }


    public T remove() { 
	/* remove the first element in the array 
	 * and copy the rest front. 
	 * FIFO structure. 
	 * If the ArrayList is empty return null
	 */
	/* Option 1: */
	if(isEmpty()) return null;
	// IMPLEMENT THE REST 

	//
        return this.data[--nextItem];
	// which option is better? why? 
    }


}
	 

	