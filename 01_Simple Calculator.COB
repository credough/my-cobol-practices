              IDENTIFICATION DIVISION.
       PROGRAM-ID. CREDO.
       ENVIRONMENT DIVISION.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  NUM1        PIC 9(5)V9(2) VALUE 0.
       77  NUM2        PIC 9(5)V9(2) VALUE 0.
       77  RESULT      PIC 9(7)V9(2) VALUE 0.
       77  OPERATOR    PIC X VALUE SPACE.
       77  CONTINUE-FLAG PIC X VALUE 'Y'.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           DISPLAY "==============================".
           DISPLAY "     SIMPLE COBOL CALCULATOR  ".
           DISPLAY "==============================".

           PERFORM UNTIL CONTINUE-FLAG NOT = 'Y'
               DISPLAY "Enter first number: "
               ACCEPT NUM1
               DISPLAY "Enter operator (+ - * /): "
               ACCEPT OPERATOR
               DISPLAY "Enter second number: "
               ACCEPT NUM2

               EVALUATE OPERATOR
                   WHEN "+"
                       COMPUTE RESULT = NUM1 + NUM2
                   WHEN "-"
                       COMPUTE RESULT = NUM1 - NUM2
                   WHEN "*"
                       COMPUTE RESULT = NUM1 * NUM2
                   WHEN "/"
                       IF NUM2 NOT = 0
                           COMPUTE RESULT = NUM1 / NUM2
                       ELSE
                           DISPLAY "Error: Division by zero!"
                           MOVE 0 TO RESULT
                       END-IF
                   WHEN OTHER
                       DISPLAY "Invalid operator!"
                       MOVE 0 TO RESULT
               END-EVALUATE

               DISPLAY "Result: " RESULT
               DISPLAY "Do you want to continue? (Y/N): "
               ACCEPT CONTINUE-FLAG
               MOVE FUNCTION UPPER-CASE(CONTINUE-FLAG) TO CONTINUE-FLAG
           END-PERFORM.

           DISPLAY "Thank you for using the calculator!".
           STOP RUN.
