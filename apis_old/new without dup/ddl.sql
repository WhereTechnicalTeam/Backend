COPY public.auth_user(id, password, username, email, date_joined) FROM '/home/jed/Desktop/projects/personal/Backend-master/apis_old/new without dup/user.csv' WITH (FORMAT CSV, HEADER, DELIMITER ',', QUOTE '"');


SELECT SETVAL('userprofile_id_seq', (SELECT MAX(id) + 1 FROM public.userprofile));