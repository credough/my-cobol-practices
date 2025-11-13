       IDENTIFICATION DIVISION.
       PROGRAM-ID. Average_Grade.
       AUTHOR. Aaron Creed.
       DATE-WRITTEN. 11-13-2025.
       DATE-COMPILED. 11-13-2025.
       REMARKS. why am i learning this haha.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  MATH     PIC 99(3)V99 VALUE 0.
       01  SCIENCE  PIC 99(3)V99 VALUE 0.
       01  LANGUAGE PIC 99(3)V99 VALUE 0.
       01  PE       PIC 99(3)V99 VALUE 0.
       01  FIL      PIC 99(3)V99 VALUE 0.
       01  AVERAGE  PIC 99(3)V99 VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PROGRAM.
           DISPLAY "PLEASE ENTER YOUR GRADES"
           DISPLAY "IN MATH: "
           ACCEPT MATH
           DISPLAY "IN SCIENCE: "
           ACCEPT SCIENCE
           DISPLAY "IN LANGUAGE: "
           ACCEPT LANGUAGE
           DISPLAY "IN PE: "
           ACCEPT PE
           DISPLAY "IN FILIPINO: "
           ACCEPT FIL

           COMPUTE AVERAGE = (MATH + SCIENCE + LANGUAGE + PE + FIL) / 5

           DISPLAY "TOTAL AVERAGE: " AVERAGE

           STOP RUN.
