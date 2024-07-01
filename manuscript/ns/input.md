## User input

Now it is password and simple text but in the future some other methods like single and multichoice should move here.

### input password

```bash
echo "Please enter your password: " # 1234
read -rs password
echo "${password}" # 1234
```

### input text | ask question

Get simple text from user and put in a variable.

```bash
read -rep "what are you reading? " -i "Shellman ebook" answer
echo "${answer}"
```

### 