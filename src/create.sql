
CREATE TABLE IF NOT EXISTS HOSTS (
  URL TEXT PRIMARY KEY,
  COUNTER INTEGER NOT NULL DEFAULT 1,
  STATUS INTEGER NOT NULL DEFAULT 0,
  NOTES TEXT ,
  UNIQUE(URL)
);

INSERT INTO HOSTS (URL ) VALUES( 'https://www.bbc.com') ON CONFLICT (URL) DO UPDATE SET COUNTER = COUNTER + 1;
INSERT INTO HOSTS (URL ) VALUES( 'https://www.cnn.com') ON CONFLICT (URL) DO UPDATE SET COUNTER = COUNTER + 1;
SELECT * FROM HOSTS;


CREATE TABLE IF NOT EXISTS ARTICALS (
  URL TEXT PRIMARY KEY,
  COUNTER INTEGER NOT NULL DEFAULT 1,
  STATUS INTEGER NOT NULL DEFAULT 0,
  NOTES TEXT ,
  UNIQUE(URL)
);

INSERT INTO ARTICALS (URL ) VALUES( 'https://www.bbc.com/news/articles/c4g278yn4d3o') ON CONFLICT (URL) DO UPDATE SET COUNTER = COUNTER + 1;
SELECT * FROM ARTICALS;


DROP TABLE  IF EXISTS log;

CREATE TABLE IF NOT EXISTS log(
    msg TEXT,
	event_type TEXT GENERATED ALWAYS AS (json_extract(msg, '$.event_type')) VIRTUAL
);


INSERT INTO log (msg) VALUES('{"event_type": "hashmap_num_keys", "keys": 20, "loop_iteration": 4}');
INSERT INTO log (msg) VALUES('{"event_type": "hashmap_num_keys", "keys": 21, "loop_iteration": 5}');
INSERT INTO log (msg) VALUES('{"event_type": "hashmap_num_keys", "keys": 22, "loop_iteration": 6}');
INSERT INTO log (msg) VALUES('{"event_type": "hashmap_num_keys", "keys": 23, "loop_iteration": 7}');
INSERT INTO log (msg) VALUES('{"event_type": "hashmap_num_keys", "keys": 24, "loop_iteration": 8}');

DROP VIEW  IF EXISTS hashmap_keys;
create view if not exists hashmap_keys as
	select
	json_extract(msg, '$.event_type') as event_type,
	json_extract(msg, '$.keys') as keys,
	json_extract(msg, '$.loop_iteration') as loop_iteration
from log
where json_extract(msg, '$.event_type') = 'hashmap_num_keys';

select * from hashmap_keys where loop_iteration > 5;
