" Vim syntax file
" Language:     yql
" Maintainer:   Ivan Blinkov <blinkov@yandex-team.ru>
" Last Change:  $LastChangedDate: 2016-12-30 12:51:04 +0300 (Mon, 30 Dec 2016) $
" Filenames:    *.sql
" URL:          https://a.yandex-team.ru/arc/trunk/arcadia/yql/tools/gen_syntax_highlight/yql.vim

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Always ignore case
syn case ignore

" General keywords which don't fall into other categories
syn keyword yqlKeyword         $row $rows action all and as asc assume begin bernoulli between by case columns commit compact create cross cube declare define delete desc dict discard distinct do drop else empty_action end erase evaluate exclusion exists export flatten for from full group grouping having if ignore ilike import in inner insert into is join left like limit list match not null nulls offset on only optional or order over partition pragma presort process reduce regexp repeatable replace respect result return right rlike rollup sample schema select semi set sets stream subquery table tablesample then truncate union update upsert use using values view when where window with without xor

" Special values
syn keyword yqlSpecial         false true

" Strings (single- and double-quote)
syn region yqlString           start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region yqlString           start=+'+  skip=+\\\\\|\\'+  end=+'+
syn region yqlString           start=+@@+ skip=+@@@@+ end=+@@+

" Numbers and hexidecimal values
syn match yqlNumber            "-\=\<[0-9]*\>"
syn match yqlNumber            "-\=\<[0-9]*\.[0-9]*\>"
syn match yqlNumber            "-\=\<[0-9][0-9]*e[+-]\=[0-9]*\>"
syn match yqlNumber            "-\=\<[0-9]*\.[0-9]*e[+-]\=[0-9]*\>"
syn match yqlNumber            "\<0x[abcdefABCDEF0-9]*\>"
syn match yqlNumber            "\<0b[0-1]*\>"

" User variables
syn match yqlVariable          "\$[a-z0-9_]*"

" Escaped column names
syn match yqlEscaped           "`[^`]*`"
syn region yqlEscaped          start="`" end="`"

" Comments (c-style, yql-style and modified sql-style)
syn region yqlComment          start="/\*"  end="\*/"
syn match yqlComment           "--.*"

" Column types

syn keyword yqlType           bool date datetime decimal double float int16 int32 int64 int8 interval json string timestamp tzdate tzdatetime tztimestamp uint16 uint32 uint64 uint8 utf8 uuid yson

" General Functions
syn keyword yqlFunction       abs aggregate_by aggregate_list aggregate_list_distinct agg_list agg_list_distinct as_table avg avg_if adaptivedistancehistogram adaptivewardhistogram adaptiveweighthistogram addmember addtimezone aggregateflatten aggregatetransforminput aggregatetransformoutput aggregationfactory asatom asdict asdictstrict asenum aslist asliststrict asset assetstrict asstruct astagged astuple asvariant atomcode bitcast bit_and bit_or bit_xor bool_and bool_or bool_xor bottom bottom_by blockwardhistogram blockweighthistogram cast coalesce concat concat_strict correlation count count_if covariance covariance_population covariance_sample callableargument callableargumenttype callableresulttype callabletype callabletypecomponents callabletypehandle choosemembers combinemembers countdistinctestimate currentauthenticateduser currentoperationid currentoperationsharedid currenttzdate currenttzdatetime currenttztimestamp currentutcdate currentutcdatetime currentutctimestamp dense_rank datatype datatypecomponents datatypehandle dictaggregate dictcontains dictcreate dicthasitems dictitems dictkeytype dictkeys dictlength dictlookup dictpayloadtype dictpayloads dicttype dicttypecomponents dicttypehandle each each_strict emptydicttype emptydicttypehandle emptylisttype emptylisttypehandle endswith ensure ensureconvertibleto ensuretype enum evaluateatom evaluatecode evaluateexpr evaluatetype expandstruct filter filter_strict find first_value folder filecontent filepath flattenmembers forceremovemember forceremovemembers forcerenamemembers forcespreadmembers formatcode formattype frombytes frompg funccode greatest grouping gathermembers generictype histogram hll hoppingwindowpgcast hyperloglog if if_strict instanceof json_exists json_query json_value jointablerow just lag last_value lead least len length like likely like_strict lambdaargumentscount lambdacode lambdaoptionalargumentscount linearhistogram listaggregate listall listany listavg listcode listcollect listconcat listcreate listdistinct listenumerate listextend listextendstrict listextract listfilter listflatmap listflatten listfold listfold1 listfold1map listfoldmap listfromrange listfromtuple listhas listhasitems listhead listindexof listitemtype listlast listlength listmap listmax listmin listnotnull listreplicate listreverse listskip listskipwhile listskipwhileinclusive listsort listsortasc listsortdesc listsum listtake listtakewhile listtakewhileinclusive listtotuple listtype listtypehandle listunionall listuniq listzip listzipall loghistogram logarithmichistogram max max_by max_of median min min_by min_of mode multi_aggregate_by nanvl nvl nothing nulltype nulltypehandle optionalitemtype optionaltype optionaltypehandle percentile parsefile parsetype parsetypehandle pgand pgarray pgcall pgconst pgnot pgop pgor pickle quotecode range range_strict rank regexp regexp_strict rfind row_number random randomnumber randomuuid removemember removemembers removetimezone renamemembers replacemember reprcode resourcetype resourcetypehandle resourcetypetag some stddev stddev_population stddev_sample substring sum sum_if sessionstart sessionwindow setcreate setdifference setincludes setintersection setisdisjoint setsymmetricdifference setunion spreadmembers stablepickle startswith staticmap staticzip streamitemtype streamtype streamtypehandle structmembertype structmembers structtypecomponents structtypehandle subqueryextend subqueryextendfor subquerymerge subquerymergefor subqueryunionall subqueryunionallfor subqueryunionmerge subqueryunionmergefor top topfreq top_by tablename tablepath tablerecordindex tablerow tablerows taggedtype taggedtypecomponents taggedtypehandle tobytes todict tomultidict topg toset tosorteddict tosortedmultidict trymember tupleelementtype tupletype tupletypecomponents tupletypehandle typehandle typekind typeof udaf udf unittype unpickle untag unwrap variance variance_population variance_sample variant varianttype varianttypehandle variantunderlyingtype voidtype voidtypehandle way worldcode
syn match yqlUdf              "[a-z0-9_]*::[a-z0-9_]*"

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link yqlKeyword            Statement
hi def link yqlSpecial            Number
hi def link yqlString             String
hi def link yqlNumber             Number
hi def link yqlVariable           Special
hi def link yqlComment            Comment
hi def link yqlType               Type
hi def link yqlFunction           Function
hi def link yqlUdf                Question
hi def link yqlEscaped            Constant

let b:current_syntax = "yql"

