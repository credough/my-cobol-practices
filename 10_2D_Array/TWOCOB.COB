       IDENTIFICATION DIVISION.
       PROGRAM-ID. 2DIMENSION.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT ASSIGN TO "STUDENTS.TXT".
           SELECT OUTFILE ASSIGN TO "REPORT.TXT".

       DATA DIVISION.
       FILE SECTION.

       FD STUDENT.
       01 STU-REC.
           02 YEAR-DATA OCCURS 4 TIMES.
              03 COURSE-DATA OCCURS 2 TIMES.
                 04 COURSE-NUM PIC 999.

       FD OUTFILE.
       01 OUTREC PIC X(80).

       WORKING-STORAGE SECTION.

       01 I        PIC 9 VALUE 0.
       01 J        PIC 9 VALUE 0.
       01 EOFSW    PIC 9 VALUE 0.

       01 TOTAL-YEAR.
           02 TOTAL-ENTRY OCCURS 4 TIMES PIC 9(4) VALUE 0.

       01 DETAILS-LINE.
           02 FILLER          PIC X(5) VALUE SPACES.
           02 P-YEAR          PIC X(10).
           02 FILLER          PIC X(3) VALUE SPACES.
           02 P-TAB OCCURS 2 TIMES.
              03 FILLER          PIC X(3) VALUE SPACES.
              03 P-COURSE     PIC 999.
           02 FILLER          PIC X(3) VALUE SPACES.
           02 P-TOTAL         PIC 9(4).

       PROCEDURE DIVISION.

       MAIN-RTN.
           OPEN INPUT STUDENT
                OUTPUT OUTFILE.

           READ STUDENT
               AT END MOVE 1 TO EOFSW.

           IF EOFSW = 1
               DISPLAY "NO INPUT FOUND."
               STOP RUN
           END-IF.

           PERFORM COMPUTE-TOTALS.
           PERFORM WRITE-HEADING.
           PERFORM WRITE-DETAILS.

           CLOSE STUDENT OUTFILE.
           STOP RUN.

       COMPUTE-TOTALS.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 2
                   ADD COURSE-NUM(I,J) TO TOTAL-ENTRY(I)
               END-PERFORM
           END-PERFORM.

       WRITE-HEADING.
           MOVE "     YEAR            BSIT  BSCS  TOTAL" TO OUTREC.
           WRITE OUTREC.

       WRITE-DETAILS.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 4

               EVALUATE I
                   WHEN 1 MOVE "FRESHMEN "  TO P-YEAR
                   WHEN 2 MOVE "SOPHOMORE" TO P-YEAR
                   WHEN 3 MOVE "JUNIOR   " TO P-YEAR
                   WHEN 4 MOVE "SENIOR   " TO P-YEAR
               END-EVALUATE

               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 2
                   MOVE COURSE-NUM(I,J) TO P-COURSE(J)
               END-PERFORM

               MOVE TOTAL-ENTRY(I) TO P-TOTAL

               MOVE DETAILS-LINE TO OUTREC
               WRITE OUTREC
           END-PERFORM.
