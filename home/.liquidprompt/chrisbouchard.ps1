#############################
# MY LIQUID PROMPT TEMPLATE #
#############################

# add time, jobs, load and battery
LP_PS1="${LP_PS1_PREFIX}${LP_TIME}${LP_BATT}${LP_LOAD}${LP_JOBS}"
# add user, host and permissions colon
LP_PS1="${LP_PS1}${LP_BRACKET_OPEN}${LP_USER}${LP_HOST}${LP_PERM}"

LP_PS1="${LP_PS1}${LP_PWD}${LP_BRACKET_CLOSE}${LP_VENV}${LP_PROXY}"

# Add VCS infos
# If root, the info has not been collected unless LP_ENABLE_VCS_ROOT
# is set.
LP_PS1="${LP_PS1}${LP_VCS}"

# add return code and prompt mark
LP_PS1="${LP_PS1}${LP_RUNTIME}${LP_ERR}${LP_MARK_PREFIX}${LP_MARK}${LP_PS1_POSTFIX}"

# "invisible" parts
# Get the current prompt on the fly and make it a title
# Added by Chris Bouchard: And filter out the escape sequences.
LP_TITLE_PS1="$(echo -n "$LP_PS1" | \
    sed 's/'$(echo -e -n '\033')'\[[0-9;]*m//g' | \
    sed 's/'$(echo -e -n '\033')'(B//g')"
LP_TITLE="$(_lp_title "$LP_TITLE_PS1")"

# Insert it in the prompt
LP_PS1="${LP_TITLE}${LP_PS1}"

# vim: set ft=zsh:
