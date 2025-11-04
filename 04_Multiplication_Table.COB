       IDENTIFICATION DIVISION.
       PROGRAM-ID. Credo.
       AUTHOR. Aaron Creed.
       DATE-WRITTEN. 11-04-2025.
       DATE-COMPILED. 11-04-2025.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Num       PIC 9(3) VALUE ZERO.
       01 Counter   PIC 9(2) VALUE 1.
       01 Result    PIC 9(3) VALUE ZERO.

       PROCEDURE DIVISION.
       MAIN-PROGRAM.
           DISPLAY "Enter what number"
           ACCEPT Num

           PERFORM VARYING Counter FROM 1 by 1 UNTIL Counter > Num
               COMPUTE Result = Num * Counter
               DISPLAY Num " * " Counter " = " Result
           END-PERFORM

           STOP RUN.
