## miscellaneous

Contains `other` operations not available in namespaces.

### ask question

Ask a question from user and receive its answer from input. It is possible to provide a default answer to the question.

```bash
#!/usr/bin/env bash

read -ep "What is your name? " -i Remisa ANSWER
echo "$ANSWER" # print user's answer
```
