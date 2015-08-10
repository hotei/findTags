<center>
# findTags
</center>

## OVERVIEW

findTags will to find (go) program lines that have been tagged as "of interest".
That includes lines like "if true" or "if false" that are used in a development
stage but need to be resolved before going into production phase. Lines can 
also have an "ignore me" tag for resolved issues that need to stay in the code,
for instance if the resolution was just to ignore it for a while.

### Installation

If you have a working go installation on a Unix-like OS:

> ```go get github.com/hotei/findTags```

That will copy github.com/hotei/findTags to the first entry of your $GOPATH

or if go is not installed yet :

> ```cd DestinationDirectory```

> ```git clone https://github.com/hotei/findTags.git```

### Features
* simple

```
findTags findTags.go  results in:

findTags.go
findTags.go    20: "if false",
findTags.go    21: "if true",
findTags.go    22: "8888",
findTags.go    23: "MagicNumber",
findTags.go    24: "BUG(",
findTags.go    25: "TODO(",
```

### Limitations

* ?

### BUGS
* none known

### Change Log
* 2015-08-09 compiled with 1.5rc1
* started when?

 
### Resources

* [go language reference] [1] 
* [go standard library package docs] [2]
* [Source for findTags] [3]

[1]: http://golang.org/ref/spec/ "go reference spec"
[2]: http://golang.org/pkg/ "go package docs"
[3]: http://github.com/hotei/findTags "github.com/hotei/findTags"

Comments can be sent to <hotei1352@gmail.com> or to user "hotei" at github.com.
License is BSD-two-clause seen below.

### License
```
Released with BSD 2-clause license 

Copyright (c) 2015 - David Rook  <hotei1352@gmail.com>

All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met: 

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer. 
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution. 

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

Documentation (c) 2015 David Rook
