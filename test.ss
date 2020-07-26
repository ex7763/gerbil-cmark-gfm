(import :ex7763/cmark-gfm)
(import :std/srfi/151)


(write
    (doc->xml (md->doc "# adfd" ex7763/cmark-gfm#CMARK_OPT_DEFAULT) ex7763/cmark-gfm#CMARK_OPT_DEFAULT) 
  )

(write
    (doc->xml (md->doc "# adfd\n [[test]]" ex7763/cmark-gfm#CMARK_OPT_DEFAULT) ex7763/cmark-gfm#CMARK_OPT_DEFAULT) 
  )

(write
    (md->html "# adfd\n [[test]]" ex7763/cmark-gfm#CMARK_OPT_DEFAULT)
  )

(write
    (md->html " | hi   | lo   |
                | ---- | ---- |
                | 5    | 7    |
                "
              (bitwise-ior ex7763/cmark-gfm#CMARK_OPT_DEFAULT
                           ex7763/cmark-gfm#CMARK_OPT_TABLE_PREFER_STYLE_ATTRIBUTES
                           ex7763/cmark-gfm#CMARK_OPT_SOURCEPOS

                           ex7763/cmark-gfm#CMARK_OPT_LIBERAL_HTML_TAG
                           ex7763/cmark-gfm#CMARK_OPT_FULL_INFO_STRING
                           ))
    )

(write
  (doc->xml
    (md->doc " | hi   | lo   |
                | ---- | ---- |
                | 5    | 7    |
                ``` python
                in = 10
                for i in range(100):
                    in += 10
                ```
                "
              (bitwise-ior ex7763/cmark-gfm#CMARK_OPT_DEFAULT
                           ex7763/cmark-gfm#CMARK_OPT_TABLE_PREFER_STYLE_ATTRIBUTES
                           ex7763/cmark-gfm#CMARK_OPT_SOURCEPOS

                           ex7763/cmark-gfm#CMARK_OPT_LIBERAL_HTML_TAG
                           ex7763/cmark-gfm#CMARK_OPT_FULL_INFO_STRING
                           ))

              (bitwise-ior ex7763/cmark-gfm#CMARK_OPT_DEFAULT
                           ex7763/cmark-gfm#CMARK_OPT_TABLE_PREFER_STYLE_ATTRIBUTES
                           ex7763/cmark-gfm#CMARK_OPT_SOURCEPOS

                           ex7763/cmark-gfm#CMARK_OPT_LIBERAL_HTML_TAG
                           ex7763/cmark-gfm#CMARK_OPT_FULL_INFO_STRING
                           )
    
              )
    )
