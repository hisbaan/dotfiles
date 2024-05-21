;;; doom-custom-theme.el --- inspired by Atom One Dark and modified by Hisbaan Noorani -*- no-byte-compile: t; -*-
(require 'doom-themes)

;; rose pine colors:

;; default:
;; base00: "191724"
;; base01: "1f1d2e"
;; base02: "26233a"
;; base03: "555169"
;; base04: "6e6a86"
;; base05: "e0def4"
;; base06: "f0f0f3"
;; base07: "c5c3ce"
;; base08: "e2e1e7"
;; base09: "eb6f92"
;; base0A: "f6c177"
;; base0B: "ebbcba"
;; base0C: "31748f"
;; base0D: "9ccfd8"
;; base0E: "c4a7e7"
;; base0F: "e5e5e5"

;; moon:
;; base00: "232136"
;; base01: "2a273f"
;; base02: "393552"
;; base03: "59546d"
;; base04: "817c9c"
;; base05: "e0def4"
;; base06: "f5f5f7"
;; base07: "d9d7e1"
;; base08: "ecebf0"
;; base09: "eb6f92"
;; base0A: "f6c177"
;; base0B: "ea9a97"
;; base0C: "3e8fb0"
;; base0D: "9ccfd8"
;; base0E: "c4a7e7"
;; base0F: "b9b9bc"

;; dawn:
;; base00: "faf4ed"
;; base01: "fffaf3"
;; base02: "f2e9de"
;; base03: "9893a5"
;; base04: "6e6a86"
;; base05: "575279"
;; base06: "555169"
;; base07: "26233a"
;; base08: "1f1d2e"
;; base09: "b4637a"
;; base0A: "ea9d34"
;; base0B: "d7827e"
;; base0C: "286983"
;; base0D: "56949f"
;; base0E: "907aa9"
;; base0F: "c5c3ce"

(defgroup doom-custom-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-one-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-custom-theme
  :type 'boolean)

(defcustom doom-one-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-custom-theme
  :type 'boolean)

(defcustom doom-one-comment-bg doom-one-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-custom-theme
  :type 'boolean)

(defcustom doom-one-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-custom-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-custom
  "A dark theme inspired by Atom One Dark and modified by Hisbaan Noorani"

  ;; name        default   256       16
  ((bg         '("#282c34" nil       nil            ))
   (bg-alt     '("#21242b" nil       nil            ))
   (base0      '("#232136" "black"   "black"        ))
   (base1      '("#2a273f" "#1e1e1e" "brightblack"  ))
   (base2      '("#393552" "#2e2e2e" "brightblack"  ))
   (base3      '("#59546d" "#262626" "brightblack"  ))
   (base4      '("#817c9c" "#3f3f3f" "brightblack"  ))
   (base5      '("#e0def4" "#525252" "brightblack"  ))
   (base6      '("#f5f5f7" "#6b6b6b" "brightblack"  ))
   (base7      '("#d9d7e1" "#979797" "brightblack"  ))
   (base8      '("#ecebf0" "#dfdfdf" "white"        ))
   (fg         '("#bbc2cf" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#5B6268" "#2d2d2d" "white"        ))

   (grey       base4)
   (red        '("#eb6f92" "#eb6f92" "red"          ))
   (orange     '("#ea9a97" "#ea9a97" "brightred"    ))
   (green      '("#98be65" "#98be65" "green"        ))
   (teal       '("#3e8fb0" "#3e8fb0" "brightgreen"  ))
   (yellow     '("#f6c177" "#f6c177" "yellow"       ))
   (blue       '("#3e8fb0" "#3e8fb0" "brightblue"   ))
   (dark-blue  '("#2257A0" "#2257A0" "blue"         ))
   (magenta    '("#c4a7e7" "#c4a7e7" "brightmagenta"))
   (violet     '("#c4a7e7" "#c4a7e7" "magenta"      ))
   (cyan       '("#9ccfd8" "#9ccfd8" "brightcyan"   ))
   (dark-cyan  '("#5699AF" "#5699AF" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        magenta)
   (comments       (if doom-one-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-one-brighter-comments dark-cyan base5) 0.25))
   (constants      violet)
   (functions      magenta)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        green)
   (variables      (doom-lighten magenta 0.4))
   (numbers        orange)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-one-brighter-modeline)
   (-modeline-pad
    (when doom-one-padded-modeline
      (if (integerp doom-one-padded-modeline) doom-one-padded-modeline 4)))

   (modeline-fg     fg)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (doom-darken blue 0.475)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken blue 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt)))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (evil-goggles-default-face :inherit 'region :background (doom-blend region bg 0.5))

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-one-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; Doom modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)

   ;; ivy-mode
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; LaTeX-mode
   (font-latex-math-face :foreground green)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ()
  )

;;; doom-custom-theme.el ends here
