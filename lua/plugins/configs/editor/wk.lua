local wk = require("which-key")

wk.setup({
  operators = {
    gc = "Comments",
    gb = "Comments",
  },
  motions = {
    s = "Leap",
    S = "Leap backward",
  },
})

wk.register({
  c = {
    name = "line-comment",
    c = "Line-Comment",
    O = "Add a comment on the line above",
    o = "Add a comment on the line below",
    A = "Add comment at the end of line",
  },
  b = {
    name = "block-comment",
    c = "Block-comment",
  },
}, { prefix = "g" })

wk.register({
  ys = "Add surround",
  yss = "Add surround in at a line",
  yS = "Add the delimiter pair on new lines",
  ySS = "Add the delimiter pair on the new line",
  S = { "Toggle surround in visual mode", mode = { "v", "x" } },
  ds = "Delete surround",
  cs = "Change surround",
  ["<C-g>s"] = { "Insert surround", mode = "i" },
  ["<C-g>S"] = { "Insert line", mode = "i" },
})

wk.register({
  s = "Leap",
  S = "Leap backward",
}, { mode = { "n", "v", "o", "x" } })

wk.register({
  f = {
    name = "find",
    f = "Find file",
    r = "Find recent file",
    y = "Find yanks in killring",
  },
}, { prefix = "<leader>" })

wk.register({
  ii = "inside lines with same indentations.",
  ai = "around lines with same indentations.",
  iI = "inside lines with same or higher indentations.",
  aI = "around lines with same or higher indentations.",
  R = "lines down with same or higher indentations.",
  is = "like iw, but treating -, _, and . as word delimiters and only part of camelCase",
  as = "like aw, but treating -, _, and . as word delimiters and only part of camelCase",
  ["%"] = "from cursor to next closing ], ), or }",
  r = "like }, but linewise",
  gG = "entire buffer as one text object",
  n = "from cursor position to end of line, minus one character",
  ["_"] = "current line, but characterwise",
  ["|"] = "column down until indent or shorter line. Accepts {count} for multiple columns.",
  iv = "inside value of key-value pair, or right side of a variable assignment (inside one line)",
  av = "around value of key-value pair, or right side of a variable assignment (inside one line)",
  ik = "inside key of key-value pair, or left side of a variable assignment",
  ak = "around key of key-value pair, or left side of a variable assignment",
  L = 'link beginning with "http"',
  ["in"] = "inside numbers, similar to <C-a>",
  an = "around numbers, similar to <C-a>",
  ["!"] = "LSP diagnostic (requires built-in LSP)",
  iz = "inside	closed fold",
  az = "around	closed fold",
  im = "inside field with the full call, like .encode(param)",
  am = "around field with the full call, like .encode(param)",
  gw = "all lines visible in the current window",
  gW = "from the cursorline to the last line in the window",
  il = "inside markdown link like [title](url)",
  al = "around markdown link like [title](url)",
  iC = "inside markdown fenced code (enclosed by three backticks)",
  aC = "around markdown fenced code (enclosed by three backticks)",
  ic = "inside class in CSS like .my-class",
  ac = "around class in CSS like .my-class",
  ix = 'inside attribute in html/xml like href="foobar.com"',
  ax = 'around attribute in html/xml like href="foobar.com"',
  ["i/"] = "inside JavaScript regex pattern",
  ["a/"] = "around JavaScript regex pattern",
  iD = "inside text enclosed by [[]]",
  aD = "around text enclosed by [[]]",
  iP = "inside command stdout is piped to",
  aP = "around command stdout is piped to",
}, { mode = "o" })
