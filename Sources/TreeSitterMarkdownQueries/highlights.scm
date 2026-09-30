; Markdown, block level. Forked from nvim-treesitter/nvim-treesitter.
;
; Upstream gives every marker one capture and every heading one capture: the `#`
; of a heading, the bullet of a list and the bar of a block quote all arrive as
; `punctuation.special`, and an h1 is indistinguishable from an h6. A theme can
; only offer a control over a distinction the grammar made, so a settings panel
; with separate rows for those would be describing something that is not there.
; This file makes the distinctions; the names stay inside the upstream families
; so a theme that knows only `punctuation.special` still resolves them by the
; longest-prefix match Runestone documents in `CreatingATheme`.

(atx_heading (atx_h1_marker) heading_content: (inline) @text.title.1)
(atx_heading (atx_h2_marker) heading_content: (inline) @text.title.2)
(atx_heading (atx_h3_marker) heading_content: (inline) @text.title.3)
(atx_heading (atx_h4_marker) heading_content: (inline) @text.title.4)
(atx_heading (atx_h5_marker) heading_content: (inline) @text.title.5)
(atx_heading (atx_h6_marker) heading_content: (inline) @text.title.6)

(setext_heading (paragraph) @text.title.1 (setext_h1_underline))
(setext_heading (paragraph) @text.title.2 (setext_h2_underline))

; The `#`, and the ==== a setext heading is underlined with.
[
  (atx_h1_marker)
  (atx_h2_marker)
  (atx_h3_marker)
  (atx_h4_marker)
  (atx_h5_marker)
  (atx_h6_marker)
  (setext_h1_underline)
  (setext_h2_underline)
] @punctuation.special.heading

[
  (link_title)
  (indented_code_block)
  (fenced_code_block)
] @text.literal

; The fence. Named with the inline backtick rather than apart from it: both are
; the mark that says code, and a reader who dims one means the other.
[
  (fenced_code_block_delimiter)
] @punctuation.special.code

(code_fence_content) @none

[
  (link_destination)
] @text.uri

[
  (link_label)
] @text.reference

[
  (list_marker_plus)
  (list_marker_minus)
  (list_marker_star)
  (list_marker_dot)
  (list_marker_parenthesis)
] @punctuation.special.list

(thematic_break) @punctuation.special.rule

[
  (block_continuation)
  (block_quote_marker)
] @punctuation.special.quote

[
  (backslash_escape)
] @string.escape
