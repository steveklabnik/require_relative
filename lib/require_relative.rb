$:.delete(".")

def require_relative file
  $:.unshift(".")
  ret = require file
  $:.delete(".")
  ret
end
