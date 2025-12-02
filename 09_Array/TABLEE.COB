       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABLEE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT ASSIGN TO "STUDENT.TXT".
           SELECT OUTFILE ASSIGN TO "REPORT.TXT".

       DATA DIVISION.
       FILE SECTION.

       FD STUDENT
           LABEL RECORD IS STANDARD
           DATA RECORD IS INREC.

       01 INREC.
           02 SNO      PIC 9(5).
           02 SNA      PIC X(25).
           02 QUIZ     OCCURS 5 TIMES PIC 99.

       FD OUTFILE
           LABEL RECORD IS OMITTED
           DATA RECORD IS OUTREC.

       01 OUTREC PIC X(80).

       WORKING-STORAGE SECTION.
       01 EOFSW        PIC 9 VALUE 0.
       01 I            PIC 9 VALUE 1.
       01 TQ           PIC 9(3) VALUE 0.
       01 AVE          PIC 9(3)V99.

       01 STU-COUNT    PIC 9(4) VALUE 0.

       01 HDR.
           02 FILLER PIC X(19) VALUE SPACES.
           02 FILLER PIC X(12) VALUE "POLYTECHNIC ".
           02 FILLER PIC X(29) VALUE "UNIVERSITY OF THE PHILIPPINES".
           02 FILLER PIC X(20) VALUE SPACES.

       01 HDR1.
           02 FILLER PIC X(38) VALUE SPACES.
           02 FILLER PIC X(4)  VALUE "CCIS".
           02 FILLER PIC X(38) VALUE SPACES.

       01 HDR2.
           02 FILLER PIC X(15) VALUE "Student Number".
           02 FILLER PIC X(2)  VALUE SPACES.
           02 FILLER PIC X(13) VALUE "Student Name".
           02 FILLER PIC X(12) VALUE SPACES.
           02 FILLER PIC X(2)  VALUE "Q1".
           02 FILLER PIC X(3)  VALUE SPACES.
           02 FILLER PIC X(2)  VALUE "Q2".
           02 FILLER PIC X(3)  VALUE SPACES.
           02 FILLER PIC X(2)  VALUE "Q3".
           02 FILLER PIC X(3)  VALUE SPACES.
           02 FILLER PIC X(2)  VALUE "Q4".
           02 FILLER PIC X(3)  VALUE SPACES.
           02 FILLER PIC X(2)  VALUE "Q5".
           02 FILLER PIC X(3)  VALUE SPACES.
           02 FILLER PIC X(7)  VALUE "AVERAGE".

       01 DETALYE.
           02 FILLER      PIC X(1) VALUE SPACE.
           02 P-SNO       PIC 9(5).
           02 FILLER      PIC X(8) VALUE SPACES.
           02 P-SNA       PIC X(25).
           02 FILLER      PIC X(3) VALUE SPACES.
           02 PRT-Q       OCCURS 5 TIMES.
              03 PRT-QUIZ PIC 99.
              03 FILLER   PIC X(3).
           02 PRT-AVE     PIC 99.99.
           02 FILLER      PIC X(6) VALUE SPACES.

       PROCEDURE DIVISION.
       MAIN-RTN.

           OPEN INPUT STUDENT
                OUTPUT OUTFILE.

           PERFORM INIT-RTN.
           PERFORM CCMIT-RTN UNTIL EOFSW = 1.
           PERFORM FINISH-RTN.

           CLOSE STUDENT OUTFILE.
           STOP RUN.

       INIT-RTN.
           MOVE 0 TO EOFSW.
           MOVE 0 TO STU-COUNT.
           WRITE OUTREC FROM HDR AFTER 1 LINE.
           WRITE OUTREC FROM HDR1 AFTER 1 LINE.
           WRITE OUTREC FROM HDR2 AFTER 1 LINE.
           EXIT.

       CCMIT-RTN.
           READ STUDENT
           AT END MOVE 1 TO EOFSW
               GO TO CCMIT-RTN-END
           END-READ.

           MOVE SNO TO P-SNO.
           MOVE SNA TO P-SNA.
           MOVE 0 TO TQ.

           PERFORM BSIT-RTN
           VARYING I FROM 1 BY 1 UNTIL I > 5.

           COMPUTE AVE = (TQ * 100 / 5 + 0.5) / 100
           MOVE AVE TO PRT-AVE.

           WRITE OUTREC FROM DETALYE AFTER 1 LINE.
           ADD 1 TO STU-COUNT.

       CCMIT-RTN-END.
           EXIT.


       BSIT-RTN.
           MOVE QUIZ(I) TO PRT-QUIZ(I).
           ADD QUIZ(I) TO TQ.
           EXIT.

       FINISH-RTN.
           MOVE SPACES TO OUTREC.
           STRING "TOTAL NUMBER OF STUDENTS: " DELIMITED BY SIZE
                  STU-COUNT DELIMITED BY SIZE
                  INTO OUTREC
           END-STRING.
           WRITE OUTREC AFTER 1 LINE.
           EXIT.
