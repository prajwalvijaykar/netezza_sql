CREATE OR REPLACE PROCEDURE my_dataset.TRUNCATE_TABLE(CHARACTER VARYING(ANY))
                            RETURNS  CHARACTER VARYING(ANY)

                            LANGUAGE NZPLSQL AS
                            BEGIN_PROC
                            DECLARE
                            tempTableName ALIAS FOR $1;
                                    tempTableName2 ALIAS FOR $2;
                            BEGIN

                            execute IMMEDIATE  'truncate table ' || tempTableName ;
                            execute IMMEDIATE  'truncate table ' || tempTableName2 ;

                            return 'Table truncated' ;

                            END_PROC;
