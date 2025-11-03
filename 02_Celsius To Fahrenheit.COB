       IDENTIFICATION DIVISION.
       PROGRAM-ID. converter.
       AUTHOR. Aaron Creed.
       DATE-WRITTEN. 2025-11-03.
       REMARKS. Simple celsius to fahrenheit converter.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Celsius    PIC 9(3).
       01 Fahrenheit PIC 9(3)V9(1).

       PROCEDURE DIVISION.
       MAIN-PROGRAM.
           DISPLAY "Enter temperature in Celsius: "
           ACCEPT Celsius
           COMPUTE Fahrenheit = (Celsius * 9 / 5) + 32
           DISPLAY "Temperature in Fahrenheit: " Fahrenheit
           STOP RUN.
