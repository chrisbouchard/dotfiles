" Vim syntax file
" Language:      Maude <http://maude.cs.uiuc.edu/>
" Maintainer:    Chris Bouchard <chris@upliftinglemma.net>
" Last Modified: 2018-05-26
" Version: 0.2

" Quit if syntax file is already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn sync fromstart

syn keyword maudeCommands   load reduce

syn cluster maudeModules    contains=maudeFmod,maudeFth,maudeMod,maudeTh,maudeOmod,maudeView

syn keyword maudeFmod       fmod nextgroup=maudeFmodTop skipwhite skipempty
syn match   maudeFmodTop    "\_.\{-}\(\<is\>\)\@=" contained nextgroup=maudeFmodBody skipwhite skipempty
syn region  maudeFmodBody   matchgroup=maudeFmod start="\<is\>" end="\<endfm\>" fold contains=@maudeFuncStms

syn keyword maudeFth        fth nextgroup=maudeFthTop skipwhite skipempty
syn match   maudeFthTop     "\_.\{-}\(\<is\>\)\@=" contained nextgroup=maudeFthBody skipwhite skipempty
syn region  maudeFthBody    matchgroup=maudeFth start="\<is\>" end="\<endfth\>" fold contains=@maudeFuncStms

syn keyword maudeMod        mod nextgroup=maudeModTop skipwhite skipempty
syn match   maudeModTop     "\_.\{-}\(\<is\>\)\@=" contained nextgroup=maudeModBody skipwhite skipempty
syn region  maudeModBody    matchgroup=maudeMod start="\<is\>" end="\<endm\>" fold contains=@maudeSysStms

syn keyword maudeTh         th nextgroup=maudeThTop skipwhite skipempty
syn match   maudeThTop      "\_.\{-}\(\<is\>\)\@=" contained nextgroup=maudeThBody skipwhite skipempty
syn region  maudeThBody     matchgroup=maudeTh start="\<is\>" end="\<endth\>" fold contains=@maudeSysStms

" TODO: Add statements for omods.
syn keyword maudeOmod       omod nextgroup=maudeOmodTop skipwhite skipempty
syn match   maudeOmodTop    "\_.\{-}\(\<is\>\)\@=" contained nextgroup=maudeOmodBody skipwhite skipempty
syn region  maudeOmodBody   matchgroup=maudeOmod start="\<is\>" end="\<endom\>" fold contains=@maudeSysStms

syn keyword maudeView       view nextgroup=maudeViewTop skipwhite skipempty
syn match   maudeViewTop    "\_.\{-}\(\<is\>\)\@=" contained contains=maudeViewFrom,maudeViewTo nextgroup=maudeViewBody skipwhite skipempty
syn keyword maudeViewFrom   from contained
syn keyword maudeViewTo     to contained
syn region  maudeViewBody   matchgroup=maudeView start="\<is\>" end="\<endv\>" fold contains=@maudeViewStms

syn cluster maudeStatements contains=@maudeFuncStms,@maudeSysStms,@maudeViewStms
syn cluster maudeFuncStms   contains=@maudeImports,@maudeSorts,maudeVarStm,maudeOpStm,maudeEqStm,maudeCeqStm,maudeMbStm,maudeCmbStm
syn cluster maudeSysStms    contains=@maudeFuncStms,maudeRlStm,maudeCrlStm
syn cluster maudeViewStms   contains=maudeSortStm,maudeVarStm,maudeOpStm

syn cluster maudeImports    contains=maudePrStm,maudeInStm,maudeExStm
syn region  maudePrStm      matchgroup=maudeImports start="\<pr\(otecting\)\=\>" end="\.\(\s*$\)\@=" contained contains=@maudeBuiltins
syn region  maudeInStm      matchgroup=maudeImports start="\<in\(cluding\)\=\>" end="\.\(\s*$\)\@=" contained contains=@maudeBuiltins
syn region  maudeExStm      matchgroup=maudeImports start="\<ex\(tending\)\=\>" end="\.\(\s*$\)\@=" contained contains=@maudeBuiltins

syn cluster maudeSorts      contains=maudeSortStm,maudeSubsortStm
syn region  maudeSortStm    matchgroup=maudeStatements start="\<sorts\=\>" end="\.\(\s*$\)\@=" contained contains=@maudeBuiltins
syn region  maudeSubsortStm matchgroup=maudeStatements start="\<subsorts\=\>" end="\.\(\s*$\)\@=" contained contains=@maudeBuiltins

syn region  maudeVarStm     matchgroup=maudeStatements start="\<vars\=\>" end="\.\(\s*$\)\@=" contained contains=@maudeBuiltins,maudeVarStmOps
syn match   maudeVarStmOps  ":"

syn region  maudeOpStm      matchgroup=maudeStatements start="\<ops\=\>" end="\.\(\s*$\)\@=" contained contains=@maudeBuiltins,maudeOpStmOps
syn match   maudeOpStmOps   ":\|_" contained
syn match   maudeOpStmOps   "->\|\~>" contained nextgroup=maudeOpStmRange skipwhite skipempty
syn match   maudeOpStmRange "\S\+" contained contains=@maudeBuiltins nextgroup=maudeOpFlags,maudeOpStmRange skipwhite skipempty
syn match   maudeOpFlags    "\[\_.\{-}\]\(\s*\.\s*$\)\@=" contained contains=maudeFlagsBkt,maudeAttrs,maudeLiteral

syn region  maudeEqStm      matchgroup=maudeStatement start="\<eq\>" end="\.\(\s*$\)\@=" contained contains=@maudeStmStuff,maudeEqStmOps,maudeEqFlags
syn region  maudeCeqStm     matchgroup=maudeStatements start="\<ceq\>" end="\.\(\s*$\)\@=" contained contains=@maudeStmStuff,maudeEqStmOps,maudeEqFlags
syn region  maudeMbStm      matchgroup=maudeStatements start="\<mb\>" end="\.\(\s*$\)\@=" contained contains=@maudeStmStuff,maudeMbStmOps,maudeMbFlags
syn region  maudeCmbStm     matchgroup=maudeStatements start="\<cmb\>" end="\.\(\s*$\)\@=" contained contains=@maudeStmStuff,maudeMbStmOps,maudeMbFlags
syn region  maudeRlStm      matchgroup=maudeStatements start="\<rl\>" end="\.\(\s*$\)\@=" contained contains=@maudeStmStuff,maudeRlStmOps,maudeRlFlags
syn region  maudeCrlStm     matchgroup=maudeStatements start="\<crl\>" end="\.\(\s*$\)\@=" contained contains=@maudeStmStuff,maudeRlStmOps,maudeRlFlags

syn cluster maudeStmStuff   contains=@maudeBuiltins,maudeStmOps,maudeStmVar,maudeStmQid,maudeBoolOps,maudeMetaExpr,maudeLiteral
syn match   maudeStmOps     "==\|:=\|::\|/\\"
syn match   maudeStmVar     "['-]\@<!\<\S\+:\S\+\>" contained
syn match   maudeStmVar     "['-]\@<!\<[A-Z][A-Z0-9'?`-]*\>" contained
syn match   maudeStmQid     "'\([^ `(){}\[\]]\|`[`(){}\[\]]\)\+" contained

syn keyword maudeBoolOps    and or xor not implies if then else fi
syn match   maudeBoolOps    "\<and-then\>"
syn match   maudeBoolOps    "\<or-else\>"

syn match   maudeEqStmOps   "="
syn match   maudeMbStmOps   ":"
syn match   maudeRlStmOps   "=>"

syn match   maudeEqFlags    "\(^\|\s\+\)\@<=\[\_.\{-}\]\(\s*\.\s*$\)\@=" contained contains=maudeFlagsBkt,maudeAttrs,maudeLiteral
" TODO: Use nextgroup like we do for op
syn match   maudeMbFlags    "\(:\_.*\S\_\s\+\)\@<=\[\_.\{-}\]\(\s*\.\s*$\)\@=" contained contains=maudeFlagsBkt,maudeAttrs,maudeLiteral
syn match   maudeRlFlags    "\(^\|\s\+\)\@<=\[\_.\{-}\]\(\s*\.\s*$\)\@=" contained contains=maudeFlagsBkt,maudeAttrs,maudeLiteral

syn match   maudeFlagsBkt   "\[" contained
syn match   maudeFlagsBkt   "\]" contained
syn keyword maudeAttrs      assoc comm idem iter id left-id right-id strat memo contained
syn keyword maudeAttrs      prec gather format ctor config object msg frozen contained
syn keyword maudeAttrs      poly special label metadata owise nonexec ditto print contained

syn region  maudeMetaExpr   start="\<fmod\>" end="\<endfm\>" contained contains=@maudeStmStuff
syn region  maudeMetaExpr   start="\<fth\>" end="\<endfth\>" contained contains=@maudeStmStuff
syn region  maudeMetaExpr   start="\<mod\>" end="\<endm\>" contained contains=@maudeStmStuff
syn region  maudeMetaExpr   start="\<th\>" end="\<endth\>" contained contains=@maudeStmStuff
syn region  maudeMetaExpr   start="\<omod\>" end="\<endom\>" contained contains=@maudeStmStuff
syn region  maudeMetaExpr   start="\<view\>" end="\<endv\>" contained contains=@maudeStmStuff

syn cluster maudeBuiltins   contains=maudeBuiltinModules,maudeBuiltinSorts

syn keyword maudeBuiltinModules INT FLOAT NAT RAT BOOL QID TRUTH IDENTICAL STRING
syn keyword maudeBuiltinModules CONVERSION
syn match   maudeBuiltinModules "\<TRUTH-VALUE\>"
syn match   maudeBuiltinModules "\<EXT-BOOL\>"
syn match   maudeBuiltinModules "\<QID-LIST\>"
syn match   maudeBuiltinModules "\<META-MODULE\>"
syn match   maudeBuiltinModules "\<META-TERM\>"
syn match   maudeBuiltinModules "\<META-LEVEL\>"
syn match   maudeBuiltinModules "\<LOOP-MODE\>"
syn match   maudeBuiltinModules "\<CONFIGURATION\>"

syn keyword maudeBuiltinSorts   Bool Int Float Nat Qid
syn keyword maudeBuiltinSorts   Zero NzNat NzInt NzRat Rat FiniteFloat
syn keyword maudeBuiltinSorts   String Char FindResult DecFloat

syn keyword maudeBuiltinSorts   Sort Kind Type
syn keyword maudeBuiltinSorts   Constant Variable GroundTerm Term GroundTermList TermList
syn keyword maudeBuiltinSorts   Assignment Substitution
syn keyword maudeBuiltinSorts   Context CTermList GTermList
syn keyword maudeBuiltinSorts   Attr AttrSet
syn keyword maudeBuiltinSorts   Renaming RenamingSet
syn keyword maudeBuiltinSorts   ModuleExpression
syn keyword maudeBuiltinSorts   Import ImportList
syn keyword maudeBuiltinSorts   SortSet SubsortDecl SubsortDeclSet
syn keyword maudeBuiltinSorts   TypeList NatList QidList
syn keyword maudeBuiltinSorts   Hook HookList
syn keyword maudeBuiltinSorts   OpDecl OpDeclSet EqCondition Condition
syn keyword maudeBuiltinSorts   MembAx MembAxSet Equation EquationSet
syn keyword maudeBuiltinSorts   Rule RuleSet
syn keyword maudeBuiltinSorts   FModule SModule FTheory STheory Module
syn keyword maudeBuiltinSorts   Bound KindSet
syn keyword maudeBuiltinSorts   ResultPair ResultTriple Result4Tuple MatchPair
syn keyword maudeBuiltinSorts   State System
syn keyword maudeBuiltinSorts   Attribute AttributeSet
syn keyword maudeBuiltinSorts   Oid Cid Object Msg Configuration
syn match   maudeBuiltinSorts   "\<Type\?\>"
syn match   maudeBuiltinSorts   "\<ResultPair\?\>"
syn match   maudeBuiltinSorts   "\<ResultTriple\?\>"
syn match   maudeBuiltinSorts   "\<Result4Tuple\?\>"
syn match   maudeBuiltinSorts   "\<MatchPair\?\>"
syn match   maudeBuiltinSorts   "\<Substitution\?\>"

syn keyword maudeLiteral    true false
syn match   maudeLiteral    "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   maudeLiteral    "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn region  maudeLiteral    start="\"" end="\"" skip="\\\""

syn match   maudeComment    "\*\*\*.*" containedin=ALL
syn match   maudeComment    "---.*" containedin=ALL

hi def link maudeFmod       Structure
hi def link maudeFth        Structure
hi def link maudeMod        Structure
hi def link maudeTh         Structure
hi def link maudeOmod       Structure
hi def link maudeView       Structure
hi def link maudeViewFrom   Structure
hi def link maudeViewTo     Structure
hi def link maudeImports    Include
hi def link maudeSorts      Type
hi def link maudeStatements Keyword
hi def link maudeComment    Comment
hi def link maudeVarStmOps  Special
hi def link maudeBoolOps    Keyword
hi def link maudeStmOps     Special
hi def link maudeOpStmOps   Special
hi def link maudeEqStmOps   Special
hi def link maudeMbStmOps   Special
hi def link maudeRlStmOps   Special
hi def link maudeCommands   Special
hi def link maudeFlagsBkt   Special
hi def link maudeAttrs      PreProc
hi def link maudeLiteral    String
hi def link maudeStmVar     Identifier
hi def link maudeStmQid     Constant
hi def link maudeBuiltinModules Type
hi def link maudeBuiltinSorts   Type
"hi def      maudeMisc       term=bold cterm=bold gui=bold

let b:current_syntax = "maude"

"EOF vim: tw=78:ft=vim:ts=8

