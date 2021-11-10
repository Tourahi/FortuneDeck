readFile = (file) ->
  f = io.open file, "r"
  assert f != nil, "No such file. [ReadFile]"
  output = f\read '*a'
  f\close!
  output



{ readFile: readFile }
