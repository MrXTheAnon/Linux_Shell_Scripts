#!/usr/bin/env python3

import sys
import json

def prettify_json(json_string):
    try:
        json_data = json.loads(json_string)
        prettified_json = json.dumps(json_data, indent=4)
        return prettified_json
    except ValueError as e:
        return f"Error: {e}"

if __name__ == "__main__":
    json_string = sys.stdin.read()
    prettified_json = prettify_json(json_string)
    print(prettified_json)

