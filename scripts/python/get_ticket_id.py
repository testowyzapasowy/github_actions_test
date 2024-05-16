import sys, json;

# file = open('generated.json')
# full_json = json.load(file)
# file.close()

full_json = json.load(sys.stdin)

pr_url = sys.argv[1]

try:
    project_items = full_json["items"]
    [id] = [item["id"] for item in project_items if ("url" in item["content"] and item["content"]["url"] == pr_url)]
    print(id)
except:
    print("An exception occurred in get_ticket.py")
    sys.exit(1)
    # print(full_json)
    # print("provided PR_URL:", pr_url)

