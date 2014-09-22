insert into Messages (
	  section_id
	, author
	, message
	, version_no
)
select
	  section_id
	, /* author */'test'
	, /*message*/'test'
	, 1
 from Sections where section_key=/*section*/'test001'