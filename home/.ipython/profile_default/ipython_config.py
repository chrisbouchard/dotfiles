from powerline.bindings.ipython.since_5 import PowerlinePrompts

c = get_config()
c.TerminalInteractiveShell.editing_mode = 'vi'
c.TerminalInteractiveShell.prompts_class = PowerlinePrompts
c.TerminalInteractiveShell.simple_prompt = False

