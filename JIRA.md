
```txt
issueFunction in addedAfterSprintStart("Scrum Board", "Sprint")
issueFunction in subtasksOf("labels = 'test'")

issueFunction in issueFieldMatch("project = DSRC", "RM: Skill keywords", "Node*") and issuetype = "RM: Employee"
issue in issuesWithResourceAssignments("customfield_11803", "20-01-01", "","first.last", "first.last", ...)
  yy-mm-dd

```

```txt
{noformat}
{code}
```

```txt
require ["body"];

if allof( header :contains "From"  "jira@dsr-corporation.com" )
{
  if anyof(header :contains "Subject" "mentioned you",
           body   :contains "mentioned") {
.........
```
