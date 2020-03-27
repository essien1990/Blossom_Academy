--create stackoverflow_filtered schema
create schema stackoverflow_filtered;
drop schema stackoverflow_filtered;
--set search path to stackoverflow_filtered
set search_path to stackoverflow_filtered;

--based on result data type in the lab, create the results table
CREATE TABLE results (
    users_id int4 NOT NULL PRIMARY KEY,
    display_name text NOT NULL,
    reputation text NULL,
    website_url text NULL,
    "location" text NULL,
    about_me text NULL,
    "views" int4 NULL,
    up_votes int4 NULL,
    down_votes int4 NULL,
    image_url text NULL,
    users_created_at timestamp NOT NULL,
    updated_at timestamp NOT null,
    city text NULL,
    country text NULL,
    questions_id int4 NOT NULL  ,
    questions_user_id int4 not NULL,
    title text NOT NULL,
    questions_body text NOT NULL,
    accepted_answer_id int4 NULL,
    questions_score int4 NOT NULL DEFAULT 0,
    view_count int4 NOT NULL DEFAULT 0,
    questions_comment_count int4 NOT NULL DEFAULT 0,
    questions_created_at timestamp NOT null,
    answers_id int4 NOT NULL,
    answers_user_id int4 NULL,
    answers_question_id int4 NOT NULL,
    answers_body text NOT NULL,
    answers_score int4 NOT NULL DEFAULT 0,
    answers_comment_count int4 NOT NULL DEFAULT 0,
    answers_created_at timestamp null
 );

select * from results;

ALTER TABLE results ALTER COLUMN country TYPE text;


--create a ​btree ​​index ​ on the reputation column within the results table
CREATE UNIQUE INDEX reputation_idx ON results (reputation);

--create a ​hash index ​ on the display_name column within the results table.
CREATE INDEX display_name_idx ON results USING hash(display_name);

--From the results table, create a ​view ​with the column names ​display_name, city, questions_id ​where the ​accepted_answer_id ​ is not null
CREATE VIEW stackoverflow_filtered.stack_view as  
select display_name, city, questions_id 
from blossom.stackoverflow_filtered.results 
where  accepted_answer_id is not null;


--Create a materialized view with different columns name
CREATE MATERIALIZED VIEW stackoverflow_filtered.materialized_view as
select display_name, city, questions_id 
from blossom.stackoverflow_filtered.results 
where  accepted_answer_id is not null;
