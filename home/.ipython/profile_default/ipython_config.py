from IPython import get_ipython
from prompt_toolkit.filters import ViInsertMode

from powerline.bindings.ipython.since_5 import PowerlinePrompts

ip = get_ipython()
insert_mode = ViInsertMode()

c = get_config()
c.TerminalInteractiveShell.simple_prompt = False
c.TerminalInteractiveShell.prompts_class = PowerlinePrompts

