function fish_user_key_bindings
  fzf_key_bindings

  # stop trying to edit command when typing the word "secret"
  bind --preset -M insert \ee true
  bind --preset \ee true
  # stop trying to sudo when typing the word "pods"
  bind --preset -M insert \es true
  bind --preset \es true
end
