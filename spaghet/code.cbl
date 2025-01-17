IDENTIFICATION DIVISION.
PROGRAM-ID. SPAGHETTI-CODE.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-CONTROL-VARIABLE PIC 9 VALUE 0.
01 WS-COUNTER PIC 9 VALUE 1.
01 WS-RESULT PIC 9 VALUE 0.

PROCEDURE DIVISION.
MAIN-SECTION.
    PERFORM INITIALIZE
    PERFORM 100-START-LOOP
    STOP RUN.

INITIALIZE.
    MOVE 0 TO WS-CONTROL-VARIABLE
    MOVE 1 TO WS-COUNTER
    MOVE 0 TO WS-RESULT.

100-START-LOOP.
    PERFORM 200-CHECK-COUNTER
    PERFORM 300-CALCULATE
    PERFORM 400-UPDATE-COUNTER
    PERFORM 500-CHECK-EXIT
    PERFORM 600-JUMP-BACK-TO-START.

200-CHECK-COUNTER.
    IF WS-COUNTER > 5
        GO TO 500-EXIT.

300-CALCULATE.
    ADD WS-COUNTER TO WS-RESULT
    DISPLAY 'COUNTER: ' WS-COUNTER
    DISPLAY 'RESULT: ' WS-RESULT.

400-UPDATE-COUNTER.
    ADD 1 TO WS-COUNTER.

500-CHECK-EXIT.
    IF WS-CONTROL-VARIABLE = 1
        GO TO 500-EXIT
    ELSE
        GO TO 600-CONTINUE.

600-JUMP-BACK-TO-START.
    IF WS-CONTROL-VARIABLE = 0
        GO TO 100-START-LOOP.

500-EXIT.
    DISPLAY 'FINAL RESULT: ' WS-RESULT
    STOP RUN.

600-CONTINUE.
    GO TO 100-START-LOOP.
