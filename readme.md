# gerbil-cmark-gfm

## Abstract
cmark-gfm is a markdown parser.  
gerbil-cmark-gfm provides bindings for the Gerbil language.  

## Installation
``` sh
$ gxpkg install github.com/ex7763/gerbil-cmark-gfm
```

## Usage
``` lisp
(import :ex7763/cmark-gfm)
(doc->xml 
    (md->doc "# adfd\n [[test]]" ex7763/cmark-gfm#CMARK_OPT_DEFAULT) 
    ex7763/cmark-gfm#CMARK_OPT_DEFAULT
    ) 
```
