" Vim syntax file
" Language:     Nice
" Maintainer:   Yaheni Akhotnikau <eao197@yahoo.com>
" URL:		http://eao197.narod.ru/projects/nice.vim
" Last Change:  2008 Feb 07

" Please check :help nice.vim for comments on some of the options available.

" Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" don't use standard HiLink, it will not work with included syntax files
if version < 508
  command! -nargs=+ NiceHiLink hi link <args>
else
  command! -nargs=+ NiceHiLink hi def link <args>
endif

setlocal iskeyword+=-

syn keyword niceClass       class interface implements extends enum override
syn keyword nicePackages    import package
syn keyword niceAssertions  assert requires ensures
syn match   niceAssertions  "!assert"
syn match   niceAssertions  "?assert"
syn keyword niceExpressions for if else while do true false alike this super
syn keyword niceExpressions instanceof synchronized new null break continue
syn keyword niceStatements  return var let try catch finally
syn keyword niceModifiers   public private protected static final transient
syn keyword niceModifiers   public-read private-write
syn keyword niceModifiers   volatile const native inline abstract

syn keyword niceBasicTypes  byte char short int long float double String void boolean

syn match   niceOptionalType  /?\i\+/
syn match   niceMandatoryType /!\i\+/

syn match   niceSpecialSymbols /<:\|->\|=>/

" match the special comment /**/
syn region  niceOneLineComment start="//" end=/$/
syn region  niceMultiLineComment start="/\*" end="*/"

" Strings and constants
syn match   niceSpecialError     contained "\\."
syn match   niceSpecialCharError contained "[^']"
syn match   niceSpecialChar      contained "\\\([0-7][0-7]\{0,2\}\|[0-3][0-7][0-7]\|[\"\\'ntbrf]\|u\x\{4\}\)"
syn region  niceString		start=+"+ end=+"+ end=+$+ contains=niceSpecialChar,niceSpecialError

syn region  niceVerbatimString start=/"""/ end=/"""/ contains=niceSpecialChar,niceSpecialError

syn region  niceBackslashString		start=+`+ end=+`+ end=+$+ contains=niceSpecialChar,niceSpecialError

syn match   niceCharacter	 "'[^']*'" contains=niceSpecialChar,niceSpecialCharError
syn match   niceCharacter	 "'\\''" contains=niceSpecialChar
syn match   niceCharacter	 "'[^\\]'"
syn match   niceNumber /\<[0-9_]\+[lLfFdD]\?\>/
syn match   niceNumber /\<0[xX][0-9_a-fA-F]\+[lL]\?\>/
syn match   niceNumber /\<0[bB][01_]\+[lL]\?\>/
syn match   niceNumber		 "\(\<[0-9][0-9_]*\.[0-9][0-9_]*\|\.[0-9][0-9_]*\)\([eE][-+]\=[0-9][0-9_]*\)\=[fFdD]\=\>"
syn match   niceNumber		 "\<[0-9][0-9_]*[eE][-+]\=[0-9][0-9_]*[fFdD]\=\>"

" unicode characters
syn match   niceSpecial "\\u\d\{4\}"

if !exists("nice_ignore_javadoc")
  syntax case ignore
  " syntax coloring for nicedoc comments (HTML)
  syntax include @niceHtml syntax/html.vim
  unlet b:current_syntax

  syn region  niceDocComment    start="/\*\*\(\s\|$\)"  end="\*/" keepend contains=niceCommentTitle,@niceHtml,niceDocTags,niceDocSeeTag
  syn region  niceCommentTitle  contained matchgroup=niceDocComment start="/\*\*"   matchgroup=niceCommentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end="\*/"me=s-1,he=s-1 contains=@niceHtml,niceCommentStar,niceDocTags,niceDocSeeTag

  syn region niceDocTags         contained start="{@\(link\|linkplain\|inherit[Dd]oc\|doc[rR]oot\|value\)" end="}"
  syn match  niceDocTags         contained "@\(param\|exception\|throws\|since\)\s\+\S\+" contains=niceDocParam
  syn match  niceDocParam        contained "\s\S\+"
  syn match  niceDocTags         contained "@\(version\|author\|return\|deprecated\|serial\|serialField\|serialData\)\>"
  syn region niceDocSeeTag       contained matchgroup=niceDocTags start="@see\s\+" matchgroup=NONE end="\_."re=e-1 contains=niceDocSeeTagParam
  syn match  niceDocSeeTagParam  contained @"\_[^"]\+"\|<a\s\+\_.\{-}</a>\|\(\k\|\.\)*\(#\k\+\((\_[^)]\+)\)\=\)\=@ extend
  syntax case match
endif

if !exists("nice_minlines")
  let nice_minlines = 10
endif
exec "syn sync ccomment niceMultiLineComment minlines=" . nice_minlines

" The default highlighting.
if version >= 508
  NiceHiLink niceClass	                Statement
  NiceHiLink nicePackages               PreProc
  NiceHiLink niceAssertions             Special
  NiceHiLink niceExpressions            Statement
  NiceHiLink niceStatements             Statement
  NiceHiLink niceModifiers              StorageClass
  NiceHiLink niceBasicTypes             Type
  NiceHiLink niceOptionalType           Special
  NiceHiLink niceMandatoryType          Special
  NiceHiLink niceSpecial		Special
  NiceHiLink niceSpecialError		Error
  NiceHiLink niceSpecialCharError	Error
  NiceHiLink niceString			String
  NiceHiLink niceVerbatimString         String
  NiceHiLink niceBackslashString        String
  NiceHiLink niceCharacter		Character
  NiceHiLink niceSpecialChar		SpecialChar
  NiceHiLink niceNumber			Number
  NiceHiLink niceError			Error
  NiceHiLink niceStringError		Error
  NiceHiLink niceStatement		Statement
  NiceHiLink niceSpecialSymbols		Operator
  NiceHiLink niceConstant		Constant
  NiceHiLink niceTodo			Todo
  NiceHiLink niceAnnotation             PreProc

  NiceHiLink niceOneLineComment         Comment
  NiceHiLink niceMultiLineComment       Comment

  NiceHiLink niceDocComment		SpecialComment
  NiceHiLink niceCommentTitle		SpecialComment
  NiceHiLink niceDocTags		Special
  NiceHiLink niceDocParam		Function
  NiceHiLink niceDocSeeTag              Special
  NiceHiLink niceDocSeeTagParam		Function
  NiceHiLink niceCommentStar		SpecialComment
endif

delcommand NiceHiLink

let b:current_syntax = "nice"

" vim: ts=8
