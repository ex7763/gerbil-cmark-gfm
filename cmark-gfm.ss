(export md->html
        md->doc
        doc->xml
        doc->html)
(extern
  cmark-markdown-to-html
  cmark-parse-document 
  cmark-render-xml
  cmark-render-html

  CMARK_OPT_DEFAULT
  CMARK_OPT_SOURCEPOS
  CMARK_OPT_HARDBREAKS
  CMARK_OPT_SAFE
  CMARK_OPT_UNSAFE
  CMARK_OPT_NOBREAKS
  CMARK_OPT_NORMALIZE
  CMARK_OPT_VALIDATE_UTF8
  CMARK_OPT_SMART
  CMARK_OPT_GITHUB_PRE_LANG
  CMARK_OPT_LIBERAL_HTML_TAG
  CMARK_OPT_FOOTNOTES
  CMARK_OPT_STRIKETHROUGH_DOUBLE_TILDE
  CMARK_OPT_TABLE_PREFER_STYLE_ATTRIBUTES
  CMARK_OPT_FULL_INFO_STRING
  )

(begin-foreign
  (namespace ("ex7763/cmark-gfm#"))
  (##namespace ("" define define-macro c-declare c-define-type c-lambda))
  (c-declare "#include <cmark-gfm.h>")

  (define-macro (define-const symbol)
    (let* ((str (symbol->string symbol))
	   (ref (string-append "___return (" str ");")))
      `(define ,symbol
	 ((c-lambda () int ,ref)))))

  (define-macro (define-c-lambda id args ret #!optional (name #f))
    (let ((name (or name (##symbol->string id))))
      `(define ,id
	 (c-lambda ,args ,ret ,name))))

  ;; https://github.com/github/cmark-gfm/blob/master/src/cmark-gfm.h
  (define-const CMARK_OPT_DEFAULT)
  (define-const CMARK_OPT_SOURCEPOS)
  (define-const CMARK_OPT_HARDBREAKS)
  (define-const CMARK_OPT_SAFE)
  (define-const CMARK_OPT_UNSAFE)
  (define-const CMARK_OPT_NOBREAKS)
  (define-const CMARK_OPT_NORMALIZE)
  (define-const CMARK_OPT_VALIDATE_UTF8)
  (define-const CMARK_OPT_SMART)
  (define-const CMARK_OPT_GITHUB_PRE_LANG)
  (define-const CMARK_OPT_LIBERAL_HTML_TAG)
  (define-const CMARK_OPT_FOOTNOTES)
  (define-const CMARK_OPT_STRIKETHROUGH_DOUBLE_TILDE)
  (define-const CMARK_OPT_TABLE_PREFER_STYLE_ATTRIBUTES)
  (define-const CMARK_OPT_FULL_INFO_STRING)

  (c-define-type cmark_node*
    (pointer "cmark_node" (*cmark_node)))

  (c-define-type cmark_llist*
    (pointer "cmark_llist" (*cmark_llist)))

  (define-c-lambda cmark-markdown-to-html (char-string int int) char-string
                                                    "cmark_markdown_to_html")

  ;; cmark_node *cmark_parse_document(const char *buffer, size_t len, int options) 
  ;(define cmark-parse-document (c-lambda (char-string int int) cmark_node* "cmark_parse_document"))
  (define-c-lambda cmark-parse-document (char-string int int) cmark_node*
                   "cmark_parse_document")

  ;; char *cmark_render_xml(cmark_node *root, int options)
  (define-c-lambda cmark-render-xml (cmark_node* int) char-string
                   "cmark_render_xml")

  (define-c-lambda cmark-render-html (cmark_node* int cmark_llist*) char-string
                   "cmark_render_html")

  (##namespace (""))
  
)


(def (md->html str (opt CMARK_OPT_DEFAULT))
  (cmark-markdown-to-html str (string-length str) opt))

(define (md->doc str opt)
  (cmark-parse-document str (string-length str) opt))

(define (doc->xml doc opt)
  (cmark-render-xml doc opt))

(define (doc->html doc opt llist)
  (cmark-render-html doc opt llist))
