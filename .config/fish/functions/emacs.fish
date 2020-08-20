# Defined in - @ line 1
function emacs --wraps=emacsclinet\ -c\ -a\ \'emacs\' --wraps=emacsclient\ -c\ -a\ \'emacs\' --description alias\ emacs\ emacsclient\ -c\ -a\ \'emacs\'
  emacsclient -c -a 'emacs' $argv;
end
