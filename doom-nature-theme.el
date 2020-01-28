;;; doom-nature-theme.el --- nature -*- no-byte-compile: t; -*-
;;; Commentary:
;;; A doom theme inspired by https://github.com/elenapan/dotfiles

;;; Code:
(require 'doom-themes)

;;
(defgroup doom-nature-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-nature-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-nature-theme
  :type 'boolean)

(defcustom doom-nature-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-nature-theme
  :type 'boolean)

(defcustom doom-nature-comment-bg doom-nature-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their legibility."
  :group 'doom-nature-theme
  :type 'boolean)

(defcustom doom-nature-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to determine the exact padding."
  :group 'doom-nature-theme
  :type '(choice integer boolean))

(eval-and-compile
  (defcustom doom-nature-region-highlight t
    "Determines the selection highlight style. Can be 'frost, 'snowstorm or t
(default)."
    :group 'doom-nature-theme
    :type 'symbol))

;; colour 1: f48fb1
;; colour 2: 34feba

;;
(def-doom-theme doom-nature
  "A dark theme inspired by Nord."

  ;; name        default   256       16
  ((bg         '("#232d39" nil       nil            ))
   (bg-alt     '("#1a222a" nil       nil            ))
   (base0      '("#050709" "black"   "black"        ))
   (base1      '("#0b0f12" "#0b0f12" "brightblack"  ))
   (base2      '("#11161c" "#11161c" "brightblack"  ))
   (base3      '("#171e25" "#171e25" "brightblack"  ))
   (base4      '("#4a5158" "#4a5158" "brightblack"  ))
   (base5      '("#777c82" "#777c82" "brightblack"  ))
   (base6      '("#a4a8ab" "#a4a8ab" "brightblack"  ))
   (base7      '("#d1d3df" "#d1d3df" "brightblack"  ))
   (base8      '("#ffffff" "#ffffff" "white"        ))
   (fg         '("#d6e9ff" "#d6e9ff" "white"        ))
   (fg-alt     base8                                 )

   (grey       (doom-lighten bg 0.1                 ))
   (red        '("#29b0cb" "#29b0cb" "red"          ))  ;; start colour 1
   (orange     '("#1f8498" "#1f8498" "brightred"    ))
   (green      '("#34ddfe" "#34ddfe" "green"        ))  ;; c1
   (teal       '("#5ce3fe" "#5ce3fe" "brightgreen"  ))
   (yellow     '("#85eafe" "#85eafe" "yellow"       ))  ;; end colour 1
   (dark-blue  '("#1f986f" "#1f986f" "blue"         ))  ;; start colour 2
   (blue       '("#29cb94" "#29cb94" "brightblue"   ))
   (magenta    '("#34feba" "#34feba" "magenta"      ))  ;; c2
   (violet     '("#5cfec7" "#5cfec7" "brightmagenta"))
   (cyan       '("#85fed5" "#85fed5" "brightcyan"   ))  ;; end colour 2
   (dark-cyan  '("#fe5c93" "#fe5c93" "cyan"         ))  ;; c3

   ;; nature specific
   (nature-err '("#ff3b3f" "#ff3b3f" "cyan"         ))
   (nature-war '("#d9b310" "#d9b310" "cyan"         ))
   (nature-suc '("#3cc47c" "#3cc47c" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      magenta)
   (vertical-bar   base2)
   (selection      blue)
   (builtin        orange)
   (comments       grey)
   (doc-comments   grey)
   (constants      dark-cyan)
   (functions      violet)
   (keywords       yellow)
   (methods        magenta)
   (operators      base6)
   (type           dark-blue)
   (strings        dark-cyan)
   (variables      magenta)
   (numbers        green)
   (region         (doom-darken base3 0.1))
   (error          orange)
   (warning        yellow)
   (success        green)
   (vc-modified    nature-war)
   (vc-added       nature-suc)
   (vc-deleted     nature-err)

   ;; custom categories
   (hidden     base3)
   (-modeline-bright doom-nature-brighter-modeline)
   (-modeline-pad
    (when doom-nature-padded-modeline
      (if (integerp doom-nature-padded-modeline) doom-nature-padded-modeline 4)))

   (region-fg bg-alt)

   (modeline-fg            fg)
   (modeline-fg-alt        base5)
   (modeline-bg            bg)
   (modeline-bg-l          base2)
   (modeline-bg-inactive   base3)
   (modeline-bg-inactive-l `(,(car base3), (cdr base6))))


  ;; --- extra faces ------------------------
  (((region &override) :foreground region-fg)
   ((line-number &override) :foreground bg)
   ((line-number-current-line &override) :foreground base6)
   ((paren-face-match &override) :foreground red :background base3 :weight 'ultra-bold)
   ((paren-face-mismatch &override) :foreground base3 :background red :weight 'ultra-bold)
   ((vimish-fold-overlay &override) :inherit 'font-lock-comment-face :background base3 :weight 'light)
   ((vimish-fold-fringe &override)  :foreground teal)

   (font-lock-comment-face :inherit 'bold :foreground comments :background (if doom-nature-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face :inherit 'font-lock-comment-face :foreground doc-comments)
   (font-lock-builtin-face :inherit 'italic :foreground builtin)
   (font-lock-keyword-face :inherit 'bold :foreground keywords)


   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   ;; modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-highlight :foreground (doom-lighten base2 0.3))
   (doom-modeline-project-dir :foreground teal :inherit 'bold )
   (doom-modeline-buffer-path :foreground red)
   (doom-modeline-buffer-file :foreground fg)
   (doom-modeline-buffer-major-mode :foreground grey)
   (doom-modeline-buffer-modified :foreground violet)
   (doom-modeline-panel :background base0)
   (doom-modeline-urgent :foreground modeline-fg)
   (doom-modeline-info :inherit 'bold :foreground cyan :background base2)

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; ediff
   (ediff-fine-diff-A    :background (doom-darken violet 0.4) :weight 'bold)
   (ediff-current-diff-A :background (doom-darken base0 0.25))

   ;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ;; centaur tabs
   (centaur-tabs-selected :background bg-alt :foreground fg)
   (centaur-tabs-unselected :background base2 :foreground fg)


   ;; --- major-mode faces -------------------
   ;; NOTE: there are lots of tweaks here to mimic the VSCode theme

   ;; css-mode / scss-mode
   (css-proprietary-property :foreground violet)
   (css-property             :foreground fg)
   (css-selector             :foreground red)

   ;; markdown-mode
   (markdown-markup-face           :foreground violet)
   (markdown-link-face             :foreground teal)
   (markdown-link-title-face       :foreground dark-cyan)
   (markdown-header-face           :foreground yellow :inherit 'bold)
   (markdown-header-delimiter-face :foreground orange :inherit 'bold)
   (markdown-language-keyword-face :foreground magenta :inherit 'italic)
   (markdown-markup-face           :foreground blue)
   (markdown-bold-face             :foreground blue)
   (markdown-table-face            :foreground fg :background bg)
   ((markdown-code-face &override) :foreground teal :background base3)

   ;; outline (affects org-mode)
   ((outline-1 &override) :foreground blue :background nil)

   ;; org-mode
   ((org-block &override) :background base2)
   ((org-block-begin-line &override) :inherit 'bold :background base2 :foreground base5)
   (org-hide :foreground hidden :background bg-alt)
   (org-link :inherit 'underline :foreground magenta)
   (org-document-info-keyword :foreground comments)
   (org-agenda-done :foreground teal)
   (org-todo :foreground red)
   (org-headline-done :foreground red)
   (solaire-org-hide-face :foreground hidden)
   (solaire-header-line-face :background base2 :foreground fg)
   (header-line :background base2 :foreground fg)
   (org-level-1 :foreground dark-cyan)
   (org-level-2 :foreground violet)
   (org-level-3 :foreground blue)
   (org-level-4 :foreground red)
   (org-level-5 :foreground magenta)
   (org-level-6 :foreground base5)
   (org-level-7 :foreground yellow)
   (org-level-8 :foreground cyan)
   (org-list-dt :foreground base5)

   ;; tooltip
   (tooltip              :background base1 :foreground fg)

   ;; haskell
   (haskell-type-face :inherit 'bold :foreground yellow)
   (haskell-constructor-face :inherit 'bold :foreground dark-cyan)
   (haskell-keyword-face :inherit 'italic :foreground red)
   (haskell-operator-face :foreground base4)
   (haskell-literate-comment-face :foreground doc-comments)
   (haskell-definition-face :inherit 'bold :foreground magenta)

   ;; magit
   (magit-section-heading :foreground red)
   (magit-branch-remote   :foreground orange)

   ;; --- extra variables ---------------------
   ;; basics
   (link :foreground fg :inherit 'underline)
   (fringe :background bg-alt :foreground bg-alt)

   ;; evil
   (evil-ex-search              :background base1  :foreground fg)
   (evil-ex-lazy-highlight      :background base1  :foreground fg)
   (evil-snipe-first-match-face :background base1  :foreground orange)

   ;; ivy
   (ivy-current-match           :background base0      :distant-foreground nil)
   (ivy-posframe-cursor         :background dark-cyan   :foreground base0)
   (ivy-minibuffer-match-face-2 :foreground red        :weight 'bold)

   ;; company
   (company-box-background      :background base1  :foreground fg )
   (company-tooltip-common      :foreground violet                )
   (company-tooltip-selection   :background base0  :foreground red)
  ))

(provide 'doom-nature-theme)
;;; doom-nature-theme.el ends here
