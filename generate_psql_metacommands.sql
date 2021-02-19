WITH db AS (
    SELECT UNNEST(ARRAY[
        'myokardia-dev-app-clinical'
        -- more db names can be mentioned here
        ])::TEXT AS "name"
)
, aggregated_table_columns AS (
    SELECT table_schema, table_name, string_agg(quote_ident(column_name),', ') AS columns_  FROM information_schema."columns" c
        JOIN db ON c.table_catalog = db."name"
        AND (table_schema LIKE 'myk%' OR table_schema LIKE 'ppd%')
        AND (column_name NOT IN ('__dq_flag','__generation_time','__hash','comprehend_update_time'))
        GROUP BY 1,2
)
, select_queries as(
    SELECT 'SELECT ' || columns_ || ' FROM ' || quote_ident(table_schema) || '.' || quote_ident(table_name) AS query, table_schema, table_name FROM aggregated_table_columns
)
, psql_copy_meta_command AS (
    SELECT  '\copy (' || query || ') to ''' || table_schema || '/' || table_name || '.csv' || ''' csv header ;' AS command
        FROM select_queries
)
SELECT command FROM psql_copy_meta_command