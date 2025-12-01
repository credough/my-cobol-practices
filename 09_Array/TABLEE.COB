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
       01 AVE          PIC 99.99.

       01 DETALYE.
           02 F1        PIC X(1) VALUE SPACE.
           02 P-SNO     PIC 9(5).
           02 F2        PIC X(2) VALUE SPACES.
           02 P-SNA     PIC X(25).
           02 F3        PIC X(2) VALUE SPACES.
           02 PRT-Q     OCCURS 5 TIMES.
              03 PRT-QUIZ PIC 99.
              03 FILLER  PIC X VALUE SPACE.
           02 F4        PIC X(2) VALUE SPACES.
           02 PRT-AVE   PIC 99.99.

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

           COMPUTE AVE = TQ / 5.
           MOVE AVE TO PRT-AVE.

           WRITE OUTREC FROM DETALYE AFTER 1 LINE.

       CCMIT-RTN-END.
           EXIT.

       BSIT-RTN.
           MOVE QUIZ(I) TO PRT-QUIZ(I).
           ADD QUIZ(I) TO TQ.
           EXIT.

       FINISH-RTN.
           EXIT.
