{frontmatter}

# Preface {#preface}

[Shellman](https://marketplace.visualstudio.com/items?itemName=Remisa.shellman) is a [vscode](https://code.visualstudio.com) snippet extension and is made to provide a high level interface for writing shell scripts. That means easy way to accomplish the job without worrying about the details. As long as you understand the interface and how it is organized, you are good. The trade-off is you miss the details and it is also a good thing. After all that's the purpose of abstraction. When you need more control you can dig dipper and deal with details but before that stay at high ground as much as you can.

When I started shell scripting, even with the best tools available I found it unorganized. I couldn't find easily how to do file, string, array... related operations. I didn't care how a string is reversed in shell scripting as long as it works (I know about best practices, performance, compatibility... but they are not my primary concerns in a new field). Give some code the string `abc` which transforms it to `cba`. If you are coming from a `OOP` background you expect[^prior] such a function in `String` class. So `Shellman` organizes such operations under related abstract groups called `namespaces` and I just searched internet to find most fitting codes that do the job and organized them.

The hard part of *shell scripting* is not *shell scripting* itself, it is understanding Linux and knowing the correct *command* and *switches*, so if you can do it in *terminal*, you can do it easily via shell script too. *Shell scripting* is useful for common tasks automation in Unix systems.

This book is a guide for beginners who want to start shell scripting with **Shellman** effectively. If you are of pragmatic type people then go ahead and read [Basics](#basics) section and desired [namespaces](##namespaces). Also the business model of **Shellman** is published on [medium](https://medium.com/@remisa.yousefvand/shellman-reborn-f2cc948ce3fc). If you have any idea or issue you can contact me via: https://github.com/yousefvand/shellman-ebook/issues

| |

Remisa Yousefvand

First edition
July 2024


[^prior]: From cognitive/statistical point of view, coming from `OOP`, or at least expecting order, you find `Shellman` convenient because its structure matches your beliefs (prior). The probability distribution curve has the same shape, so you learn fast (little update to your curve is needed). Your wishes about where to find a function just comes true.

{pagebreak}