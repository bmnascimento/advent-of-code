       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY1.
      
       ENVIRONMENT DIVISION.
      
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT DAY1INPUT
               ORGANIZATION IS LINE SEQUENTIAL
               ASSIGN TO 'DAY1INPUT.txt'.
      
       DATA DIVISION.
      
       FILE SECTION.
           FD  DAY1INPUT
               DATA RECORD IS FOOD-CAL.
           01  FOOD-CAL           PIC X(10).
      
       WORKING-STORAGE SECTION.
           01 WSS-FOOD-CAL        PIC 9(10).
           01 WSS-SOMA-CAL        PIC 9(10) VALUE 0.
           01 WSS-MAX-CAL-1       PIC 9(10) VALUE 0.
           01 WSS-MAX-CAL-2       PIC 9(10) VALUE 0.
           01 WSS-MAX-CAL-3       PIC 9(10) VALUE 0.
           01 WSS-MAX-CAL-SOMA    PIC 9(10) VALUE 0.
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN INPUT DAY1INPUT.
           PERFORM FOREVER
             READ DAY1INPUT
               AT END
                 EXIT PERFORM
               NOT AT END
                 COMPUTE WSS-FOOD-CAL = FUNCTION NUMVAL(FOOD-CAL)

                 IF FOOD-CAL NOT EQUAL SPACES
                   ADD WSS-FOOD-CAL TO WSS-SOMA-CAL
                 ELSE
                   EVALUATE TRUE
  
                     WHEN WSS-SOMA-CAL > WSS-MAX-CAL-3 AND
                          WSS-SOMA-CAL <= WSS-MAX-CAL-2
                            MOVE WSS-SOMA-CAL TO WSS-MAX-CAL-3
  
                     WHEN WSS-SOMA-CAL > WSS-MAX-CAL-2 AND
                          WSS-SOMA-CAL <= WSS-MAX-CAL-1
                            MOVE WSS-MAX-CAL-2 TO WSS-MAX-CAL-3
                            MOVE WSS-SOMA-CAL TO WSS-MAX-CAL-2
  
                     WHEN WSS-SOMA-CAL > WSS-MAX-CAL-1
                            MOVE WSS-MAX-CAL-2 TO WSS-MAX-CAL-3
                            MOVE WSS-MAX-CAL-1 TO WSS-MAX-CAL-2
                            MOVE WSS-SOMA-CAL TO WSS-MAX-CAL-1
  
                   END-EVALUATE
                   MOVE 0 TO WSS-SOMA-CAL
                 END-IF
             END-READ
           END-PERFORM.
           CLOSE DAY1INPUT.
           ADD WSS-MAX-CAL-1 TO WSS-MAX-CAL-SOMA
           ADD WSS-MAX-CAL-2 TO WSS-MAX-CAL-SOMA
           ADD WSS-MAX-CAL-3 TO WSS-MAX-CAL-SOMA
           DISPLAY "MAIOR " WSS-MAX-CAL-1
           DISPLAY "SOMA 3 MAIORES " WSS-MAX-CAL-SOMA
           STOP RUN.

