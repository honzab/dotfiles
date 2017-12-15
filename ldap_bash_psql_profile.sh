# If you have ~/.bashrc and `export LESS` is there, update it
# otherwise add it to the end of the file.
if [[ -f ~/.bashrc ]]; then
    if grep "export LESS\=" ~/.bashrc 2>&1 > /dev/null; then
        sed -i 's/export LESS\=.*$/export\ LESS\=\"\-JMQRSi\"/' ~/.bashrc
    else
        echo 'export LESS="-JMQRSi"' >> ~/.bashrc
    fi
fi

# Completely overwrite your .psqlrc
cat - > ~/.psqlrc << EOPSQLRC
\timing
\pset border 2
\pset linestyle unicode
\pset null '∅'
\set HISTFILE ~/.psql_history- :DBNAME
\set HISTCONTROL ignoredups
\set COMP_KEYWORD_CASE upper
\set replication_delay 'SELECT CASE WHEN pg_last_xlog_receive_location() = pg_last_xlog_replay_location() THEN INTERVAL \'0\' ELSE now() - pg_last_xact_replay_timestamp() END AS replication_delay';
\set index_dups '(SELECT indrelid::regclass as table, array_agg(indexrelid::regclass) as duplicates FROM pg_index group by indrelid, indkey having count(*) > 1)';
\set index_never_used '(SELECT indexrelid::regclass as index, relid::regclass as table FROM pg_stat_user_indexes JOIN pg_index USING (indexrelid) WHERE idx_scan = 0 AND indisunique is false order by relid::regclass)';
\set PROMPT1 '%[%033[33m%]%x%[%033[0m%]%[%033[33m%]%m%[%033[0m%].%[%033[34m%]%/%[%033[0m%]%R%# '
EOPSQLRC

