COPY public.auth_user(id, password, username, email, date_joined) FROM '/home/jed/Desktop/projects/personal/Backend-master/apis_old/new without dup/user.csv' WITH (FORMAT CSV, HEADER, DELIMITER ',', QUOTE '"');


update public.auth_user
set first_name = public.userprofile.firstname,
last_name = public.userprofile.surname
from public.userprofile
-- left join public.userprofile p
where public.auth_user.id = public.userprofile.user_id


SELECT SETVAL('auth_user_id_seq', (SELECT MAX(id) + 1 FROM public.auth_user));