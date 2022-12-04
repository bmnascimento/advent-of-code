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
               DATA RECORD IS FOOD-CALORIES.
           01  FOOD-CALORIES           PIC X(10).
      
       WORKING-STORAGE SECTION.
           01 WSS-FOOD-CALORIES        PIC 9(10).
           01 WSS-SOMA-CALORIAS        PIC 9(10) VALUE 0.
           01 WSS-MAX-CALORIAS         PIC 9(10) VALUE 0.
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN INPUT DAY1INPUT.
           PERFORM FOREVER
               READ DAY1INPUT
                   AT END
                       EXIT PERFORM
                   NOT AT END
                       COMPUTE WSS-FOOD-CALORIES = FUNCTION NUMVAL
                                                   (FOOD-CALORIES)
                       IF FOOD-CALORIES NOT EQUAL SPACES
                           ADD WSS-FOOD-CALORIES TO WSS-SOMA-CALORIAS
                       ELSE
                           IF WSS-SOMA-CALORIAS > WSS-MAX-CALORIAS
                              MOVE WSS-SOMA-CALORIAS TO WSS-MAX-CALORIAS
                           END-IF
                           MOVE 0 TO WSS-SOMA-CALORIAS
                       END-IF
               END-READ
           END-PERFORM.
           CLOSE DAY1INPUT.
           DISPLAY WSS-MAX-CALORIAS
           STOP RUN.

