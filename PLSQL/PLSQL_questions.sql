/*create calc function (num, num, add) */

CREATE OR REPLACE FUNCTION CALC
           (A IN NUMBER, B IN NUMBER, C IN VARCHAR2) 
          RETURN NUMBER
          IS
              D NUMBER;
          BEGIN
              IF C ='ADD' THEN D:=A+B;
              ELSIF C ='SUB' THEN D:=A-B;
              ELSIF C ='MUL' THEN D:=A*B;
              ELSIF C ='DIV' THEN D:=A/B;
              END IF;
              RETURN D;
          END;
/      
