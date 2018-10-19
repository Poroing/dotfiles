#!/usr/bin/python

import i3ipc
i3 = i3ipc.Connection()

print(next(filter(lambda workspace: workspace['focused'], i3.get_workspaces()))['name'])
