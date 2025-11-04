       IDENTIFICATION DIVISION.
       PROGRAM-ID. Credo.
       AUTHOR. Aaron Creed.
       REMARKS. A simple grade checker.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Grades PIC 9(3) VALUE ZERO.

       PROCEDURE DIVISION.
       MAIN-PROGRAM.
       GET-GRADES.
           DISPLAY "Enter your grade (0-100)"
           ACCEPT Grades
           IF Grades < 0 OR Grades > 100
               DISPLAY "Invalid! Please enter numbers between 0 to 100."
               GO GET-GRADES
           END-IF

           IF Grades >= 75
               DISPLAY "pasado ka tol"
           ELSE
               DISPLAY "sablay man, bagsak"
           END-IF
           STOP RUN.
