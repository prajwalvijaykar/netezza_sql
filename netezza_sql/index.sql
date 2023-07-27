CREATE TABLE simple_table(a STRING, b INT64, c JSON);

CREATE INDEX my_index

ON dataset.simple_table(a, c);