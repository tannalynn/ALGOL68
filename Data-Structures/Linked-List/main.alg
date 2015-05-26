PR READ "LinkedList.alg" PR;

MODE EMPLOYEE = STRUCT(STRING name, INT salary, INT years);
MODE DATA = EMPLOYEE; #/* Sets the data type that is in the list */#


#/* Function that traversals call for each node in list */#
PROC list visit = (REF DATA data) VOID:  
(
    print((
        "EMPLOYEE NAME  :  ", name OF data ,   newline,
        "         SALARY: " , salary OF data, newline,
        "         YEARS : " , years OF data,  newline
    ))
);


#******************************************************************************#
main:
(
    EMPLOYEE empl;
    name OF empl := "one";
    salary OF empl := 50;
    years OF empl := 148;
    
    LIST list := (NIL, NIL);

    list PREPEND empl; 
    name OF empl := "two";
    list APPEND empl; 
    name OF empl := "three";
    list APPEND empl; 
    name OF empl := "four";
    list APPEND empl; 

    forward traversal(list);
    PURGE list;
    forward traversal(list);
    print(".")
    
    
    
)
