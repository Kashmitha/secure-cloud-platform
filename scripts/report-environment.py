import json
import shutil
import sys

tools = ["git", "python3"] + sys.argv[1:]
report = {}

for tool in tools:
    report[tool] = shutil.which(tool)

print(json.dumps(report, indent=2))

if None in report.values():
    sys.exit(1)
