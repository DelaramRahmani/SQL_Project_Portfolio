-- Query to list all tables in the public schema of the Rockbuster database
SELECT * FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_type = 'BASE TABLE';
