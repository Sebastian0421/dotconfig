## Dissonance Ranger Theme
## 
## Created By: Ryan Scott Lewis <ryanscottlewis@gmail.com>
## License: MIT
## Version: 0.0.1

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *
import os

class Dissonance(ColorScheme):
    # Map color to terminal color code
    COLOR_MAPS = {
        'BSD': {
            'x': default,
            'a': black,
            'b': red,
            'c': green,
            'd': yellow,
            'e': blue,
            'f': magenta,
            'g': cyan,
            'h': white
        }
    }

    # Map pair index to BSD attribute key
    ANSI_BSD_MAP = ['directory', 'symlink', 'socket', 'pipe', 'executable', 'block', 'character', 'executable_with_setuid', 'executable_with_setgid', 'directory_writable_sticky', 'directory_writable']

    def __init__(self):
        colors = os.environ['LSCOLORS']

        self._colors = self._parse_ls_colors_bsd(colors)

    def _parse_ls_colors_bsd(self, data):
        result = {}

        for index, character in enumerate(data):
            name = self.ANSI_BSD_MAP[index / 2]
            attribute = 'fg' if index % 2 == 0 else 'bg'

            if not result.has_key(name):
                result[name] = { 'attr': normal }

            result[name][attribute] = self.COLOR_MAPS['BSD'][character.lower()]

            if character.isupper():
                result[name]['attr'] |= bold

        return result

    def _file_colors(self, context, fg, bg, attr):

        return fg, bg, attr

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.socket:
                fg = self._colors['socket']['fg']
                bg = self._colors['socket']['bg']
                attr |= self._colors['socket']['attr']
            if context.fifo:
                fg = self._colors['pipe']['fg'] # I think a FIFO is a pipe? TODO: Check
                bg = self._colors['pipe']['bg']
                attr |= self._colors['pipe']['attr']
            if context.device:
                fg = self._colors['block']['fg']
                bg = self._colors['block']['bg']
                attr |= self._colors['block']['attr']
            if context.directory:
                fg = self._colors['directory']['fg']
                bg = self._colors['directory']['bg']
                attr |= self._colors['directory']['attr']
            elif context.executable and not \
                    any((context.media, context.container, context.fifo, context.socket)):
                fg = self._colors['executable']['fg']
                bg = self._colors['executable']['bg']
                attr |= self._colors['executable']['attr']
            if context.link:
                if context.good:
                    fg = self._colors['symlink']['fg']
                    bg = self._colors['symlink']['bg']
                    attr |= self._colors['symlink']['attr']
                else:
                    fg = self._colors['executable']['fg']
                    bg = self._colors['executable']['bg']
                    attr |= self._colors['executable']['attr']
            if context.selected:
                attr |= reverse
            if context.marked:
                fg = yellow
                attr |= bold
            if context.copied:
                fg = black
                bg = white
                attr |= bold
            if context.cut:
                fg = black
                bg = red
                attr |= bold
        elif context.in_titlebar:
            if context.hostname:
                if context.good:
                    fg = self._colors['block']['fg']
                    bg = self._colors['block']['bg']
                    attr |= bold
                else:
                    fg = self._colors['executable']['fg']
                    bg = self._colors['executable']['bg']
                    attr |= self._colors['executable']['attr']
            elif context.directory:
                fg = self._colors['directory']['fg']
                bg = self._colors['directory']['bg']
            elif context.link:
                fg = self._colors['symlink']['fg']
                bg = self._colors['symlink']['bg']
                attr |= self._colors['symlink']['attr']
            elif context.tab:
                if context.good:
                    bg = green
        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = cyan
                elif context.bad:
                    fg = red
            if context.marked:
                fg = yellow
                attr |= bold
            if context.mtime:
                fg = yellow
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = red
            # if context.loaded:
            #     bg = self.progress_bar_color
        return fg, bg, attr
