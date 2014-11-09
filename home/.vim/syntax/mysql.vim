" Vim syntax file
" Language: mysql
" Maintainer: Chris Bouchard <snape@jbouchard.net>
" Last Change: 2009-01-26 16:46 -0500
" Filenames: *.mysql

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Always ignore case
syn case ignore

" General keywords which don't fall into other categories
syn keyword mysqlKeyword        accessible action add after aggregate all asc
syn keyword mysqlKeyword        auto_increment avg avg_row_length
syn keyword mysqlKeyword        before begin both by
syn keyword mysqlKeyword        cascade case change check column condition constraint
syn keyword mysqlKeyword        continue convert current_date current_time
syn keyword mysqlKeyword        current_timestamp current_user cursor
syn keyword mysqlKeyword        database databases day_hour day_microsecond day_minute
syn keyword mysqlKeyword        day_second declare default delayed desc deterministic
syn keyword mysqlKeyword        distinct distinctrow div dual
syn keyword mysqlKeyword        each else elseif enclosed end escaped exit
syn keyword mysqlKeyword        fetch force for foreign from fulltext function
syn keyword mysqlKeyword        group
syn keyword mysqlKeyword        having high_priority hour_microsecond hour_minute
syn keyword mysqlKeyword        hour_second
syn keyword mysqlKeyword        if ignore in index infile inout insensitive into iterate
syn keyword mysqlKeyword        key keys kill
syn keyword mysqlKeyword        leading leave limit linear lines localtime localtimestamp
syn keyword mysqlKeyword        lock loop low_priority
syn keyword mysqlKeyword        master_ssl_verify_server_cert match minute_microsecond
syn keyword mysqlKeyword        minute_second modifies 
syn keyword mysqlKeyword        no_write_to_binlog
syn keyword mysqlKeyword        on option optionally order out outfile
syn keyword mysqlKeyword        precision primary procedure purge
syn keyword mysqlKeyword        range read reads read_write references release rename
syn keyword mysqlKeyword        repeat replace require restrict returns
syn keyword mysqlKeyword        schema schemas second_microsecond sensitive separator
syn keyword mysqlKeyword        spatial specific sql sqlexception sqlstate sqlwarning
syn keyword mysqlKeyword        sql_big_result sql_calc_found_rows sql_small_result ssl
syn keyword mysqlKeyword        starting
syn keyword mysqlKeyword        table terminated then to trailing trigger
syn keyword mysqlKeyword        undo unique unlock usage use using utc_date utc_time
syn keyword mysqlKeyword        utc_timestamp
syn keyword mysqlKeyword        values
syn keyword mysqlKeyword        when where while with write
syn keyword mysqlKeyword        year_month
syn keyword mysqlKeyword        zerofill

iabb <buffer> accessible ACCESSIBLE
iabb <buffer> action ACTION
iabb <buffer> add ADD
iabb <buffer> after AFTER
iabb <buffer> aggregate AGGREGATE
iabb <buffer> all ALL
iabb <buffer> asc ASC
iabb <buffer> auto_increment AUTO_INCREMENT
iabb <buffer> avg AVG
iabb <buffer> avg_row_length AVG_ROW_LENGTH
iabb <buffer> before BEFORE
iabb <buffer> begin BEGIN
iabb <buffer> both BOTH
iabb <buffer> by BY
iabb <buffer> cascade CASCADE
iabb <buffer> case CASE
iabb <buffer> change CHANGE
iabb <buffer> check CHECK
iabb <buffer> column COLUMN
iabb <buffer> condition CONDITION
iabb <buffer> constraint CONSTRAINT
iabb <buffer> continue CONTINUE
iabb <buffer> convert CONVERT
iabb <buffer> current_date CURRENT_DATE
iabb <buffer> current_time CURRENT_TIME
iabb <buffer> current_timestamp CURRENT_TIMESTAMP
iabb <buffer> current_user CURRENT_USER
iabb <buffer> cursor CURSOR
iabb <buffer> database DATABASE
iabb <buffer> databases DATABASES
iabb <buffer> day_hour DAY_HOUR
iabb <buffer> day_microsecond DAY_MICROSECOND
iabb <buffer> day_minute DAY_MINUTE
iabb <buffer> day_second DAY_SECOND
iabb <buffer> declare DECLARE
iabb <buffer> default DEFAULT
iabb <buffer> delayed DELAYED
iabb <buffer> desc DESC
iabb <buffer> deterministic DETERMINISTIC
iabb <buffer> distinct DISTINCT
iabb <buffer> distinctrow DISTINCTROW
iabb <buffer> div DIV
iabb <buffer> dual DUAL
iabb <buffer> each EACH
iabb <buffer> else ELSE
iabb <buffer> elseif ELSEIF
iabb <buffer> enclosed ENCLOSED
iabb <buffer> end END
iabb <buffer> escaped ESCAPED
iabb <buffer> exit EXIT
iabb <buffer> fetch FETCH
iabb <buffer> force FORCE
iabb <buffer> for FOR
iabb <buffer> foreign FOREIGN
iabb <buffer> from FROM
iabb <buffer> fulltext FULLTEXT
iabb <buffer> function FUNCTION
iabb <buffer> group GROUP
iabb <buffer> having HAVING
iabb <buffer> high_priority HIGH_PRIORITY
iabb <buffer> hour_microsecond HOUR_MICROSECOND
iabb <buffer> hour_minute HOUR_MINUTE
iabb <buffer> hour_second HOUR_SECOND
iabb <buffer> if IF
iabb <buffer> ignore IGNORE
iabb <buffer> in IN
iabb <buffer> index INDEX
iabb <buffer> infile INFILE
iabb <buffer> inout INOUT
iabb <buffer> insensitive INSENSITIVE
iabb <buffer> into INTO
iabb <buffer> iterate ITERATE
iabb <buffer> key KEY
iabb <buffer> keys KEYS
iabb <buffer> kill KILL
iabb <buffer> leading LEADING
iabb <buffer> leave LEAVE
iabb <buffer> limit LIMIT
iabb <buffer> linear LINEAR
iabb <buffer> lines LINES
iabb <buffer> localtime LOCALTIME
iabb <buffer> localtimestamp LOCALTIMESTAMP
iabb <buffer> lock LOCK
iabb <buffer> loop LOOP
iabb <buffer> low_priority LOW_PRIORITY
iabb <buffer> master_ssl_verify_server_cert MASTER_SSL_VERIFY_SERVER_CERT
iabb <buffer> match MATCH
iabb <buffer> minute_microsecond MINUTE_MICROSECOND
iabb <buffer> minute_second MINUTE_SECOND
iabb <buffer> modifies MODIFIES
iabb <buffer> no_write_to_binlog NO_WRITE_TO_BINLOG
iabb <buffer> on ON
iabb <buffer> option OPTION
iabb <buffer> optionally OPTIONALLY
iabb <buffer> order ORDER
iabb <buffer> out OUT
iabb <buffer> outfile OUTFILE
iabb <buffer> precision PRECISION
iabb <buffer> primary PRIMARY
iabb <buffer> procedure PROCEDURE
iabb <buffer> purge PURGE
iabb <buffer> range RANGE
iabb <buffer> read READ
iabb <buffer> reads READS
iabb <buffer> read_write READ_WRITE
iabb <buffer> references REFERENCES
iabb <buffer> release RELEASE
iabb <buffer> rename RENAME
iabb <buffer> repeat REPEAT
iabb <buffer> replace REPLACE
iabb <buffer> require REQUIRE
iabb <buffer> restrict RESTRICT
iabb <buffer> returns RETURNS
iabb <buffer> schema SCHEMA
iabb <buffer> schemas SCHEMAS
iabb <buffer> second_microsecond SECOND_MICROSECOND
iabb <buffer> sensitive SENSITIVE
iabb <buffer> separator SEPARATOR
iabb <buffer> spatial SPATIAL
iabb <buffer> specific SPECIFIC
iabb <buffer> sql SQL
iabb <buffer> sqlexception SQLEXCEPTION
iabb <buffer> sqlstate SQLSTATE
iabb <buffer> sqlwarning SQLWARNING
iabb <buffer> sql_big_result SQL_BIG_RESULT
iabb <buffer> sql_calc_found_rows SQL_CALC_FOUND_ROWS
iabb <buffer> sql_small_result SQL_SMALL_RESULT
iabb <buffer> ssl SSL
iabb <buffer> starting STARTING
iabb <buffer> table TABLE
iabb <buffer> terminated TERMINATED
iabb <buffer> then THEN
iabb <buffer> to TO
iabb <buffer> trailing TRAILING
iabb <buffer> trigger TRIGGER
iabb <buffer> undo UNDO
iabb <buffer> unique UNIQUE
iabb <buffer> unlock UNLOCK
iabb <buffer> usage USAGE
iabb <buffer> use USE
iabb <buffer> using USING
iabb <buffer> utc_date UTC_DATE
iabb <buffer> utc_time UTC_TIME
iabb <buffer> utc_timestamp UTC_TIMESTAMP
iabb <buffer> values VALUES
iabb <buffer> when WHEN
iabb <buffer> where WHERE
iabb <buffer> while WHILE
iabb <buffer> with WITH
iabb <buffer> write WRITE
iabb <buffer> year_month YEAR_MONTH
iabb <buffer> zerofill ZEROFILL


" Special values
syn keyword mysqlSpecial        false null true

iabb <buffer> false FALSE
iabb <buffer> null NULL
iabb <buffer> true TRUE


" Operators
syn keyword mysqlOperator       and as between cross div exists in inner is join left like
syn keyword mysqlOperator       natural not on or outer regexp right rlike straight_join
syn keyword mysqlOperator       xor isnull coalesce interval sounds

syn match mysqlOperator         "\(&&\|&\|\~\||\|^\|/\|<=>\|=\|>=\|>\|<<\|<=\|<\|-\|%\)"
syn match mysqlOperator         "\(!=\|<>\|!\|||\|+\|>>\|\*\|-\)"

iabb <buffer> and AND
iabb <buffer> as AS
iabb <buffer> between BETWEEN
iabb <buffer> cross CROSS
iabb <buffer> div DIV
iabb <buffer> exists EXISTS
iabb <buffer> in IN
iabb <buffer> inner INNER
iabb <buffer> is IS
iabb <buffer> join JOIN
iabb <buffer> left LEFT
iabb <buffer> like LIKE
iabb <buffer> natural NATURAL
iabb <buffer> not NOT
iabb <buffer> on ON
iabb <buffer> or OR
iabb <buffer> outer OUTER
iabb <buffer> regexp REGEXP
iabb <buffer> right RIGHT
iabb <buffer> rlike RLIKE
iabb <buffer> straight_join STRAIGHT_JOIN
iabb <buffer> xor XOR
iabb <buffer> isnull ISNULL
iabb <buffer> coalesce COALESCE
iabb <buffer> interval INTERVAL
iabb <buffer> sounds SOUNDS


" Commands
syn keyword mysqlStatement      alter analyze call create declare delete grant insert load
syn keyword mysqlStatement      optimize return revoke select set show update

iabb <buffer> alter ALTER
iabb <buffer> analyze ANALYZE
iabb <buffer> call CALL
iabb <buffer> create CREATE
iabb <buffer> declare DECLARE
iabb <buffer> delete DELETE
iabb <buffer> grant GRANT
iabb <buffer> insert INSERT
iabb <buffer> load LOAD
iabb <buffer> optimize OPTIMIZE
iabb <buffer> return RETURN
iabb <buffer> revoke REVOKE
iabb <buffer> select SELECT
iabb <buffer> set SET
iabb <buffer> show SHOW
iabb <buffer> update UPDATE


" Strings (single- and double-quote)
syn region mysqlString          start=+"+   skip=+\\\\\|\\"+    end=+"+
syn region mysqlString          start=+'+   skip=+\\\\\|\\'+    end=+'+


" Numbers and hexidecimal values
syn match mysqlNumber            "-\=\<[0-9]*\>"
syn match mysqlNumber            "-\=\<[0-9]*\.[0-9]*\>"
syn match mysqlNumber            "-\=\<[0-9]*e[+-]\=[0-9]*\>"
syn match mysqlNumber            "-\=\<[0-9]*\.[0-9]*e[+-]\=[0-9]*\>"
syn match mysqlNumber            "\<0x[abcdefABCDEF0-9]*\>"


" User variables
syn match mysqlVariable          "@\a*[A-Za-z0-9]*[._]*[A-Za-z0-9]*"


" Comments (c-style, mysql-style and modified sql-style)
syn region mysqlComment          start="/\*"  end="\*/"
syn match mysqlComment           "#.*"
syn match mysqlComment           "--\_s.*"
syn sync ccomment mysqlComment


" Column types
syn keyword mysqlType           tinyint smallint mediumint int integer bigint int1 int2
syn keyword mysqlType           int3 int4 unsigned
syn keyword mysqlType           date datetime time timestamp year bit bool
syn keyword mysqlType           tinytext mediumtext longtext text
syn keyword mysqlType           tinyblob mediumblob longblob blob
syn keyword mysqlType           float float4 float8
syn keyword mysqlType           decimal numeric real dec
syn keyword mysqlType           char character varying varchar varcharacter
syn keyword mysqlType           binary varbinary
syn match mysqlType             "\<set\((\)\@="

iabb <buffer> tinyint TINYINT
iabb <buffer> smallint SMALLINT
iabb <buffer> mediumint MEDIUMINT
iabb <buffer> int INT
iabb <buffer> integer INTEGER
iabb <buffer> bigint BIGINT
iabb <buffer> int1 INT1
iabb <buffer> int2 INT2
iabb <buffer> int3 INT3
iabb <buffer> int4 INT4
iabb <buffer> unsigned UNSIGNED
iabb <buffer> date DATE
iabb <buffer> datetime DATETIME
iabb <buffer> time TIME
iabb <buffer> timestamp TIMESTAMP
iabb <buffer> year YEAR
iabb <buffer> bit BIT
iabb <buffer> bool BOOL
iabb <buffer> tinytext TINYTEXT
iabb <buffer> mediumtext MEDIUMTEXT
iabb <buffer> longtext LONGTEXT
iabb <buffer> text TEXT
iabb <buffer> tinyblob TINYBLOB
iabb <buffer> mediumblob MEDIUMBLOB
iabb <buffer> longblob LONGBLOB
iabb <buffer> blob BLOB
iabb <buffer> float FLOAT
iabb <buffer> float4 FLOAT4
iabb <buffer> float8 FLOAT8
iabb <buffer> decimal DECIMAL
iabb <buffer> numeric NUMERIC
iabb <buffer> real REAL
iabb <buffer> dec DEC
iabb <buffer> char CHAR
iabb <buffer> character CHARACTER
iabb <buffer> varying VARYING
iabb <buffer> varchar VARCHAR
iabb <buffer> varcharacter VARCHARACTER
iabb <buffer> binary BINARY
iabb <buffer> varbinary VARBINARY


" General Functions
"
" I'm leery of just defining keywords for functions, since according to the MySQL manual:
"
"     Function names do not clash with table or column names. For example, ABS is a 
"     valid column name. The only restriction is that for a function call, no spaces 
"     are allowed between the function name and the `(' that follows it. 
"
" This means that if I want to highlight function names properly, I have to use a 
" region to define them, not just a keyword.  This will probably cause the syntax file 
" to load more slowly, but at least it will be 'correct'.

syn match mysqlFunction         "\<abs\((\)\@=" 
syn match mysqlFunction         "\<acos\((\)\@=" 
syn match mysqlFunction         "\<adddate\((\)\@=" 
syn match mysqlFunction         "\<ascii\((\)\@=" 
syn match mysqlFunction         "\<asin\((\)\@=" 
syn match mysqlFunction         "\<atan\((\)\@=" 
syn match mysqlFunction         "\<atan2\((\)\@=" 
syn match mysqlFunction         "\<benchmark\((\)\@=" 
syn match mysqlFunction         "\<bin\((\)\@=" 
syn match mysqlFunction         "\<bit_and\((\)\@=" 
syn match mysqlFunction         "\<bit_count\((\)\@=" 
syn match mysqlFunction         "\<bit_or\((\)\@=" 
syn match mysqlFunction         "\<ceiling\((\)\@=" 
syn match mysqlFunction         "\<character_length\((\)\@=" 
syn match mysqlFunction         "\<char_length\((\)\@=" 
syn match mysqlFunction         "\<concat\((\)\@=" 
syn match mysqlFunction         "\<concat_ws\((\)\@=" 
syn match mysqlFunction         "\<connection_id\((\)\@=" 
syn match mysqlFunction         "\<conv\((\)\@=" 
syn match mysqlFunction         "\<cos\((\)\@=" 
syn match mysqlFunction         "\<cot\((\)\@=" 
syn match mysqlFunction         "\<count\((\)\@=" 
syn match mysqlFunction         "\<curdate\((\)\@=" 
syn match mysqlFunction         "\<curtime\((\)\@=" 
syn match mysqlFunction         "\<date_add\((\)\@=" 
syn match mysqlFunction         "\<date_format\((\)\@=" 
syn match mysqlFunction         "\<date_sub\((\)\@=" 
syn match mysqlFunction         "\<dayname\((\)\@=" 
syn match mysqlFunction         "\<dayofmonth\((\)\@=" 
syn match mysqlFunction         "\<dayofweek\((\)\@=" 
syn match mysqlFunction         "\<dayofyear\((\)\@=" 
syn match mysqlFunction         "\<decode\((\)\@=" 
syn match mysqlFunction         "\<degrees\((\)\@=" 
syn match mysqlFunction         "\<elt\((\)\@=" 
syn match mysqlFunction         "\<encode\((\)\@=" 
syn match mysqlFunction         "\<encrypt\((\)\@=" 
syn match mysqlFunction         "\<exp\((\)\@=" 
syn match mysqlFunction         "\<export_set\((\)\@=" 
syn match mysqlFunction         "\<extract\((\)\@=" 
syn match mysqlFunction         "\<field\((\)\@=" 
syn match mysqlFunction         "\<find_in_set\((\)\@=" 
syn match mysqlFunction         "\<floor\((\)\@=" 
syn match mysqlFunction         "\<format\((\)\@=" 
syn match mysqlFunction         "\<from_days\((\)\@=" 
syn match mysqlFunction         "\<from_unixtime\((\)\@=" 
syn match mysqlFunction         "\<get_lock\((\)\@=" 
syn match mysqlFunction         "\<greatest\((\)\@=" 
syn match mysqlFunction         "\<group_unique_users\((\)\@=" 
syn match mysqlFunction         "\<hex\((\)\@=" 
syn match mysqlFunction         "\<if\((\)\@=" 
syn match mysqlFunction         "\<ifnull\((\)\@=" 
syn match mysqlFunction         "\<inet_aton\((\)\@=" 
syn match mysqlFunction         "\<inet_ntoa\((\)\@=" 
syn match mysqlFunction         "\<instr\((\)\@=" 
syn match mysqlFunction         "\<lcase\((\)\@=" 
syn match mysqlFunction         "\<least\((\)\@=" 
syn match mysqlFunction         "\<length\((\)\@=" 
syn match mysqlFunction         "\<load_file\((\)\@=" 
syn match mysqlFunction         "\<locate\((\)\@=" 
syn match mysqlFunction         "\<log\((\)\@=" 
syn match mysqlFunction         "\<log10\((\)\@=" 
syn match mysqlFunction         "\<lower\((\)\@=" 
syn match mysqlFunction         "\<lpad\((\)\@=" 
syn match mysqlFunction         "\<ltrim\((\)\@=" 
syn match mysqlFunction         "\<make_set\((\)\@=" 
syn match mysqlFunction         "\<master_pos_wait\((\)\@=" 
syn match mysqlFunction         "\<max\((\)\@=" 
syn match mysqlFunction         "\<md5\((\)\@=" 
syn match mysqlFunction         "\<mid\((\)\@=" 
syn match mysqlFunction         "\<min\((\)\@=" 
syn match mysqlFunction         "\<mod\((\)\@=" 
syn match mysqlFunction         "\<monthname\((\)\@=" 
syn match mysqlFunction         "\<now\((\)\@=" 
syn match mysqlFunction         "\<nullif\((\)\@=" 
syn match mysqlFunction         "\<oct\((\)\@=" 
syn match mysqlFunction         "\<octet_length\((\)\@=" 
syn match mysqlFunction         "\<ord\((\)\@=" 
syn match mysqlFunction         "\<period_add\((\)\@=" 
syn match mysqlFunction         "\<period_diff\((\)\@=" 
syn match mysqlFunction         "\<pi\((\)\@=" 
syn match mysqlFunction         "\<position\((\)\@=" 
syn match mysqlFunction         "\<pow\((\)\@=" 
syn match mysqlFunction         "\<power\((\)\@=" 
syn match mysqlFunction         "\<quarter\((\)\@=" 
syn match mysqlFunction         "\<radians\((\)\@=" 
syn match mysqlFunction         "\<rand\((\)\@=" 
syn match mysqlFunction         "\<release_lock\((\)\@=" 
syn match mysqlFunction         "\<repeat\((\)\@=" 
syn match mysqlFunction         "\<reverse\((\)\@=" 
syn match mysqlFunction         "\<round\((\)\@=" 
syn match mysqlFunction         "\<rpad\((\)\@=" 
syn match mysqlFunction         "\<rtrim\((\)\@=" 
syn match mysqlFunction         "\<sec_to_time\((\)\@=" 
syn match mysqlFunction         "\<session_user\((\)\@=" 
syn match mysqlFunction         "\<sign\((\)\@=" 
syn match mysqlFunction         "\<sin\((\)\@=" 
syn match mysqlFunction         "\<soundex\((\)\@=" 
syn match mysqlFunction         "\<space\((\)\@=" 
syn match mysqlFunction         "\<sqrt\((\)\@=" 
syn match mysqlFunction         "\<std\((\)\@=" 
syn match mysqlFunction         "\<stddev\((\)\@=" 
syn match mysqlFunction         "\<strcmp\((\)\@=" 
syn match mysqlFunction         "\<subdate\((\)\@=" 
syn match mysqlFunction         "\<substring\((\)\@=" 
syn match mysqlFunction         "\<substring_index\((\)\@=" 
syn match mysqlFunction         "\<subtime\((\)\@=" 
syn match mysqlFunction         "\<sum\((\)\@=" 
syn match mysqlFunction         "\<sysdate\((\)\@=" 
syn match mysqlFunction         "\<system_user\((\)\@=" 
syn match mysqlFunction         "\<tan\((\)\@=" 
syn match mysqlFunction         "\<time_format\((\)\@=" 
syn match mysqlFunction         "\<time_to_sec\((\)\@=" 
syn match mysqlFunction         "\<to_days\((\)\@=" 
syn match mysqlFunction         "\<trim\((\)\@=" 
syn match mysqlFunction         "\<ucase\((\)\@=" 
syn match mysqlFunction         "\<unique_users\((\)\@=" 
syn match mysqlFunction         "\<unix_timestamp\((\)\@=" 
syn match mysqlFunction         "\<upper\((\)\@=" 
syn match mysqlFunction         "\<user\((\)\@=" 
syn match mysqlFunction         "\<version\((\)\@=" 
syn match mysqlFunction         "\<week\((\)\@=" 
syn match mysqlFunction         "\<weekday\((\)\@=" 
syn match mysqlFunction         "\<yearweek\((\)\@=" 

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_mysql_syn_inits")
  if version < 508
    let did_mysql_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink mysqlKeyword           Special
  HiLink mysqlSpecial           Special
  HiLink mysqlStatement         Statement
  HiLink mysqlString            String
  HiLink mysqlNumber            Number
  HiLink mysqlVariable          Identifier
  HiLink mysqlComment           Comment
  HiLink mysqlType              Type
  HiLink mysqlOperator          Function
  HiLink mysqlFunction          Function
  HiLink mysqlAggregate         Special

  delcommand HiLink
endif

let b:current_syntax = "mysql"

