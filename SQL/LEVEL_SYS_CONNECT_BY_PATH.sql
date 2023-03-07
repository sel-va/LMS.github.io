--LEVEL AND SYS_CONNECT_BY_PATH
SELECT level
FROM dual
CONNECT BY level <= 5;

SELECT SYS_CONNECT_BY_PATH('Selva', '/') AS path
FROM dual
CONNECT BY level <= 5;
          
        SELECT level, SYS_CONNECT_BY_PATH('Selva', '/') AS path
        FROM dual
        CONNECT BY level <= 5;
-------------------------------------------------------------------------
CREATE TABLE empl (
  id       INT,
  name  VARCHAR(10),
  mng_id INT
);

    INSERT INTO empl VALUES(1, 'John', NULL);
    INSERT INTO empl VALUES(2, 'Paul', 1);
    INSERT INTO empl VALUES(3, 'Nancy', 1);
    INSERT INTO empl VALUES(4, 'Sarah', 3);
    COMMIT;

SELECT * FROM EMPL;

SELECT id, name, mng_id
FROM empl
CONNECT BY PRIOR id = mng_id
ORDER BY id;
        
        SELECT id, name, mng_id, level
        FROM empl
        CONNECT BY PRIOR id = mng_id
        ORDER BY id;

SELECT id, name, mng_id, level, SYS_CONNECT_BY_PATH(name, '/') path
FROM empl
START WITH id = 1 CONNECT BY PRIOR id = mng_id
ORDER BY id;
