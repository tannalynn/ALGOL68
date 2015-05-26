#/* Linked List file */#

#/*--- Node structure - contains next and prev NODE pointers and DATA ---*/#
MODE NODE = STRUCT(
    DATA data,  #/* DATA is a type that is defined by the user in another file. *KINDA* template-y */#
    REF NODE prev, 
    REF NODE next 
    );
#/*--- List structure - contains head and tail NODE pointers ---*/#    
MODE LIST = STRUCT(
    REF NODE head, 
    REF NODE tail 
    );

#******************************************************************************#
#/*--- PREPEND - Adds a node to the beginning of the list ---*/#
PRIO PREPEND = 1; #/* Declares the priority of the operation */#
OP   PREPEND = (REF LIST list, DATA data) VOID: #/* creates and operator on a list called PREPEND */#
(                                               #/* operator call : list PREPEND data */#
    HEAP NODE n := (data, NIL, NIL); #/* Creates the new node on the heap */#
    IF head OF list IS REF NODE(NIL) THEN
        head OF list := tail OF list := n #/* If list is curently empty head and tail = new node */#
    ELSE
        next OF n := head OF list; #/* Otherwise put the new node at the front of the list */#
        prev OF head OF list := head OF list := n
    FI
);
#******************************************************************************#
#/*--- APPEND - Adds a node to the end of the list ---*/#
PRIO APPEND = 1; #/* Declares the priority of the operation */#
OP   APPEND = (REF LIST list, DATA data) VOID: #/* operator call : list APPEND data */#
(                                              
    HEAP NODE n := (data, NIL, NIL); #/* Creates the new node on the heap */#
    IF head OF list IS REF NODE(NIL) THEN
        head OF list := tail OF list := n #/* If list is curently empty head and tail = new node */#
    ELSE
        prev OF n := tail OF list; #/* Otherwise put the new node at the front of the list */#
        next OF tail OF list := tail OF list := n
    FI
);

#******************************************************************************#
#/*--- REMOVE_FIRST - removes and returns the node at the end of the list ---*/#
PRIO REMOVE_FIRST = 1;
OP   REMOVE_FIRST = (REF LIST list) DATA: #/* operation call :  REMOVE_FIRST list */#
(                                         #/* returns type DATA so    data := REMOVE_FIRST list*/#
    IF head OF list ISNT REF NODE(NIL) THEN
        DATA emp := data OF head OF list;
        prev OF next OF head OF list := NIL;
        head OF list := next OF head OF list;
        emp
    FI
);
#******************************************************************************#
#/*--- REMOVE_LAST - removes and returns the node at the end of the list ---*/#
PRIO REMOVE_LAST = 1;
OP   REMOVE_LAST = (REF LIST list) DATA:
(
    IF head OF list ISNT REF NODE(NIL) THEN
        DATA emp := data OF tail OF list;
        next OF prev OF tail OF list := NIL;
        tail OF list := prev OF tail OF list;
        emp
    FI
);
#******************************************************************************#
#/*--- PURGE - removes all elements from the list ---*/#
PRIO PURGE = 2;
OP   PURGE = (REF LIST list) VOID:
(
    head OF list := tail OF list := NIL #/* sets the refs to NIL, allowing the heap to take back the memory */#
);

#******************************************************************************#
#/* returns the data at the end of the list */#
PRIO LAST_IN = 2;
OP LAST_IN = (REF LIST list) DATA: (  
    IF head OF list ISNT REF NODE(NIL) THEN
        data OF tail OF list  
    FI 
);
#******************************************************************************#
#/* returns the data at the front of the list */#
PRIO FIRST_IN  = 2;
OP FIRST_IN = (REF LIST list) DATA: (  
    IF head OF list ISNT REF NODE(NIL) THEN 
        data OF head OF list 
    FI 
);

#******************************************************************************#
#/* Traverses through the list forwards */#
PROC forward traversal = (LIST list) VOID:
(
    REF NODE travel := head OF list;
    WHILE travel ISNT REF NODE(NIL) DO
        list visit(data OF travel);
        travel := next OF travel
    OD
);
#******************************************************************************#
#/* Traverses through the list backwards */#
PROC backward traversal = (LIST list) VOID:
(
    REF NODE travel := tail OF list;
    WHILE travel ISNT REF NODE(NIL) DO
        list visit(data OF travel);
        travel := prev OF travel
    OD
)
