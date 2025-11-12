       IDENTIFICATION DIVISION.
       PROGRAM-ID. Odd-or-Even.
       DATE-WRITTEN. 11-12-2025.
       DATE-COMPILED. 11-12-2025.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM PICTURE 9(3) VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PROGRAM.
           DISPLAY "ODD OR EVEN".
           DISPLAY "Enter a Number:"
           ACCEPT NUM.

           IF FUNCTION MOD(NUM 2) = 0
               DISPLAY "THE NUMBER IS EVEN."

           ELSE
               DISPLAY "THE NUMBER IS ODD."
           END-IF

           STOP RUN.
