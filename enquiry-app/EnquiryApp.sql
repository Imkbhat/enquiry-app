create database enquiry;
\c enquiry ;
CREATE SCHEMA enquiry;
--------------------------------------------------------
CREATE TABLE enquiry_source( enquiry_src_id serial UNIQUE, name character varying(100));

CREATE TABLE institute(institute_id serial UNIQUE, contact_id integer, name character varying(200), doe timestamp without time zone default now());

CREATE TABLE course(
	course_id serial, 
	contact_id integer, 
	name character varying(100), 
	fees numeric, 
	institute_id integer,
CONSTRAINT fk_institute_id FOREIGN KEY (institute_id)
            REFERENCES institute (institute_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE enquiry(
	enquiry_id serial UNIQUE, 
	contact_id integer, 
	doe timestamp without time zone,
	next_cal_date timestamp without time zone,
	remark character varying(200),
	committed_fees numeric,
	last_update timestamp without time zone,
	institute_id integer,
	enquiry_src_id integer,
CONSTRAINT fk_institute_id FOREIGN KEY (institute_id)
            REFERENCES institute (institute_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE,
CONSTRAINT fk_enquiry_src_id FOREIGN KEY (enquiry_src_id)
            REFERENCES enquiry_source (enquiry_src_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE enquiry_course(
	enquiry_course_id serial UNIQUE,
	enquiry_id integer, 
	enquiry_src_id integer,
CONSTRAINT fk_enquiry_id FOREIGN KEY (enquiry_id)
            REFERENCES enquiry (enquiry_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE,
CONSTRAINT fk_enquiry_src_id FOREIGN KEY (enquiry_src_id)
            REFERENCES enquiry_source (enquiry_src_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE enquiry_followup(
	enquiry_followup_id serial UNIQUE,
	enquiry_id integer, 
	doe timestamp without time zone,
	details character varying(200),
CONSTRAINT fk_enquiry_id FOREIGN KEY (enquiry_id)
            REFERENCES enquiry (enquiry_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE enquiry_contact(
	enquiry_contact_id serial UNIQUE,
	name character varying(200), 
	email character varying(50) ,
	phone character varying(45),
	local_address integer,
	permanent_address integer
);

CREATE TABLE enquiry_address(
	enquiry_address_id serial UNIQUE,
	detail character varying(200), 
	city character varying(50) ,
	country character varying(45),
	zip_code character varying(100)
);




ALTER TABLE enquiry_contact RENAME COLUMN permanent_address TO enquiry_address_id;
ALTER TABLE enquiry_contact ADD CONSTRAINT enquiry_address_id_fk FOREIGN KEY (enquiry_address_id) REFERENCES enquiry_address(enquiry_address_id) MATCH FULL;

ALTER TABLE enquiry_course ADD COLUMN course_id integer;


DROP FUNCTION IF EXISTS commacat(text, text) CASCADE;
CREATE FUNCTION commacat(initialstr text, newstr text) RETURNS text AS $$
  BEGIN
    IF newstr IS NULL OR newstr = '' THEN
      RETURN initialstr;
    ELSIF initialstr = '' THEN
	  RETURN newstr;
	ELSE
      RETURN initialstr || ', ' || newstr;
    END IF;
  END;
$$ LANGUAGE plpgsql;

CREATE AGGREGATE textcat_commacat(
  basetype    = text,
  sfunc       = commacat,
  stype       = text,
  initcond    = ''
);




