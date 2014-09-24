insert into Messages (
	  section_id
	, author
	, label
	, message
	, version_no
)
select
	  section_id
	, /* author  */'test'
	, /* label   */'label test'
	, /* message */'message body'
	, 1
 from Sections where section_key=/*section*/'test001'