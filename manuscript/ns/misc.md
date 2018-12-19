## miscellaneous

Contains `other` operations not available in namespaces.

### ask question

Ask a question from user and receive its answer from input. It is possible to provide a default answer to the question.

```bash
#!/usr/bin/env bash

read -ep "What is your name? " -i Remisa ANSWER
echo "$ANSWER" # print user's answer
```

### timeout

Run a command within a time frame.

```bash
#!/usr/bin/env bash

timeout 5 curl -s http://example.com
echo "at most 5 seconds later"
```
