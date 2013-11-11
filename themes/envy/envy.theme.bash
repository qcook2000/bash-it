#!/usr/bin/env bash
SCM_THEME_PROMPT_DIRTY="${red}*"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX="${blue}["
SCM_THEME_PROMPT_SUFFIX="${blue}]"

GIT_THEME_PROMPT_DIRTY="${red}*"
GIT_THEME_PROMPT_CLEAN=""
GIT_THEME_PROMPT_PREFIX="${blue}["
GIT_THEME_PROMPT_SUFFIX="${blue}]"

function prompt_command() {
    PS1="\n${purple}\h${reset_color}:${green}\w$(scm_prompt_info)\n${green}\$${reset_color} "
}

PROMPT_COMMAND=prompt_command;
