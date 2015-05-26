PR READ "LinkedList.alg" PR;

MODE EMPLOYEE = STRUCT(STRING name, INT salary, INT years);
MODE DATA = EMPLOYEE;


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
    
    
    append(list, empl); 
    name OF empl := "two";
    append(list, empl); 
    name OF empl := "three";
    append(list, empl); 
    name OF empl := "four";
    append(list, empl); 


    forward traversal(list)
)



