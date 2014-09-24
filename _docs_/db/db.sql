
/* Drop Tables */

DROP TABLE IF EXISTS Messages;
DROP TABLE IF EXISTS Sections;




/* Create Tables */

CREATE TABLE Messages
(
	message_id serial NOT NULL,
	section_id int NOT NULL,
	-- 投稿者のIPアドレスから計算されたユニークID
	author varchar NOT NULL,
	label text,
	message text,
	version_no int,
	registered_at timestamp DEFAULT now() NOT NULL,
	PRIMARY KEY (message_id)
) WITHOUT OIDS;


CREATE TABLE Sections
(
	section_id serial NOT NULL,
	section_key varchar(25) NOT NULL UNIQUE,
	name varchar(50) NOT NULL,
	registered_at timestamp DEFAULT now() NOT NULL,
	PRIMARY KEY (section_id)
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE Messages
	ADD FOREIGN KEY (section_id)
	REFERENCES Sections (section_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



/* Comments */

COMMENT ON COLUMN Messages.author IS '投稿者のIPアドレスから計算されたユニークID';



