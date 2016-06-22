#!/usr/bin/env python3
"""
In a side-by-side dual monitor setup (left-right), the script below will set
the brightness of the monitor with the focussed window to "normal" (100%),
while other one is dimmed to 60%. If the focus changes, the brightness will
follow the focus
"""
import subprocess
import time

def get_wposition():
    # get the position of the currently frontmost window
    try:
        w_data = subprocess.check_output(["wmctrl", "-lG"]).decode("utf-8").splitlines()
        frontmost = subprocess.check_output(["xprop", "-root", "_NET_ACTIVE_WINDOW"]).decode("utf-8").split()[-1].strip()
        z = 10-len(frontmost); frontmost = frontmost[:2]+z*"0"+frontmost[2:]
        return [int(l.split()[2]) for l in w_data if frontmost in l][0]
    except subprocess.CalledProcessError:
        pass

def get_onscreen():
    # get the size of the desktop, the names of both screens and the x-resolution of the left screen
    resdata = subprocess.check_output(["xrandr"]).decode("utf-8")
    if resdata.count(" connected") > 1:
        resdata = resdata.splitlines()
        r = resdata[0].split(); span = int(r[r.index("current")+1])
        screens = [l for l in resdata if " connected" in l]
        lr = [[(l.split()[0], int([s.split("x")[0] for s in l.split() if "+0+0" in s][0])) for l in screens if "+0+0" in l][0],
               [l.split()[0] for l in screens if not "+0+0" in l][0]]
        return [span, lr]
    else:
        print("no second screen seems to be connected")

def scr_position(span, limit, pos):
    # determine if the frontmost window is on the left- or right screen
    if limit <= pos < span:
        return [right_scr, left_scr]
    else:
        return [left_scr, right_scr]

def highlight(scr1, scr2):
    # highlight the "active" window, dim the other one
    action1 = "xrandr", "--output", scr1, "--brightness", "1.0"
    action2 = "xrandr", "--output", scr2, "--brightness", "0.6"
    for action in [action1, action2]:
        subprocess.Popen(action)

# determine the screen setup
screendata = get_onscreen()
left_scr = screendata[1][0][0]; right_scr = screendata[1][1]
limit = screendata[1][0][1]; span = screendata[0]

# set initial highlight
oncurrent1 = scr_position(span, limit, get_wposition())
highlight(oncurrent1[0], oncurrent1[1])

while True:
    time.sleep(0.5)
    pos = get_wposition()
    # bypass possible incidental failures of the wmctrl command
    if pos != None:
        oncurrent2 = scr_position(span, limit, pos)
        # only set highlight if there is a change in active window
        if oncurrent2 != oncurrent1:
            highlight(oncurrent1[1], oncurrent1[0])
        oncurrent1 = oncurrent2
