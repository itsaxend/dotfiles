#!/usr/bin/env python3
import pyfiglet

# Gradient colors (start: cyan, end: green)
start_color = (0, 142, 255)   # Cyan
end_color   = (0, 255, 0)     # Green

text = "itsAxend"
fig = pyfiglet.figlet_format(text, font="slant")

def gradient_color(start, end, steps):
    return [
        (
            int(start[0] + (end[0] - start[0]) * i / steps),
            int(start[1] + (end[1] - start[1]) * i / steps),
            int(start[2] + (end[2] - start[2]) * i / steps)
        )
        for i in range(steps)
    ]

def print_gradient(text, colors):
    for line in text.splitlines():
        width = len(line)
        char_colors = gradient_color(start_color, end_color, width)
        
        for i, char in enumerate(line):
            r, g, b = char_colors[i]
            print(f"\033[38;2;{r};{g};{b}m{char}\033[0m", end="")
        print()  # New line after each row

# Get width of the longest line in the figlet output
max_width = max(len(line) for line in fig.splitlines())
colors = gradient_color(start_color, end_color, max_width)
print_gradient(fig, colors)
