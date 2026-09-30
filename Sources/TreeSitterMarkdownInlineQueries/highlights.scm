; Markdown, inline. Forked from nvim-treesitter/nvim-treesitter.
;
; Split for the reason the block file is: upstream hands every mark back as
; `punctuation.delimiter`, so the `*` around a bold word, the backtick around a
; code span and the brackets around a link cannot be told apart by a theme. See
; `TreeSitterMarkdownQueries/highlights.scm`.

[
  (code_span)
  (link_title)
] @text.literal

(emphasis_delimiter) @punctuation.special.emphasis

(code_span_delimiter) @punctuation.special.code

(emphasis) @text.emphasis

(strong_emphasis) @text.strong

[
  (link_destination)
  (uri_autolink)
] @text.uri

[
  (link_label)
  (link_text)
  (image_description)
] @text.reference

[
  (backslash_escape)
  (hard_line_break)
] @string.escape

; ")" not part of query because of
; https://github.com/nvim-treesitter/nvim-treesitter/issues/2206
; TODO: Find better fix for this
(image ["!" "[" "]" "("] @punctuation.special.link)
(inline_link ["[" "]" "("] @punctuation.special.link)
(shortcut_link ["[" "]"] @punctuation.special.link)
