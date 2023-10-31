import sys, json;

membrane_team = json.load(sys.stdin)
pr_author = sys.argv[1]

if pr_author == "FelonEkonom":
  print("COMMUNITY")
  sys.exit(0)

for person in membrane_team:
  if person["login"] == pr_author:
    print("MEMBRANE")
    sys.exit(0)

print("COMMUNITY")

