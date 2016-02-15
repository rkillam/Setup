#!/usr/bin/env python

from __future__ import division
from __future__ import print_function

import sys


def main():
    num_added = num_deleted = num_modified = num_renamed = num_untracked = 0

    for line in sys.stdin:
        file_status = line.split()

        if file_status[0] == 'A':
            num_added += 1

        elif file_status[0] == 'D' or file_status[0] == '!':
            num_deleted += 1

        elif file_status[0] == 'M':
            num_modified += 1

        elif file_status[0] == 'R':
            num_renamed += 1

        # git unstaged or svn unstaged
        elif file_status[0] == '??' or file_status[0] == '?':
            num_untracked += 1

    ret_str = ""
    if num_added > 0:
        ret_str = "{}+{} ".format(ret_str, num_added)

    if num_deleted > 0:
        ret_str = "{}-{} ".format(ret_str, num_deleted)

    if num_modified > 0:
        ret_str = "{}M{} ".format(ret_str, num_modified)

    if num_renamed > 0:
        ret_str = "{}R{} ".format(ret_str, num_renamed)

    if num_untracked > 0:
        ret_str = "{}?{} ".format(ret_str, num_untracked)

    return ret_str.strip()


if __name__ == '__main__':
    print(main())
