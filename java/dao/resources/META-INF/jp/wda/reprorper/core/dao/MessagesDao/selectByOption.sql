select

	  m.message_id
	, m.section_id
	, m.author
	, m.label
	, m.message
	, m.version_no
	, m.registered_at

 from
	Messages m
	inner join Sections s on m.section_id=s.section_id

 where
	s.section_key=/* section */'test001'

 order by
	m.message_id DESC;
